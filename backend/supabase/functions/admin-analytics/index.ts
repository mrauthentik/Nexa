import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
}

serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders })
  }

  try {
    console.log('🔵 [admin-analytics] Request received')
    
    // Create client with anon key for auth verification
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: req.headers.get('Authorization')! },
        },
      }
    )

    // Verify admin user
    console.log('🔵 Verifying user authentication...')
    const { data: { user }, error: userError } = await supabaseClient.auth.getUser()
    
    if (userError || !user) {
      console.error('❌ Auth error:', userError)
      return new Response(JSON.stringify({ error: 'Unauthorized' }), {
        status: 401,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }
    
    console.log('✅ User authenticated:', user.id, user.email)

    // Check if user is admin
    console.log('🔵 Checking admin role...')
    const { data: profile } = await supabaseClient
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single()

    if (!profile || profile.role !== 'admin') {
      console.error('❌ User is not admin. Role:', profile?.role)
      return new Response(JSON.stringify({ error: 'Forbidden: Admin access required' }), {
        status: 403,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      })
    }
    
    console.log('✅ User is admin')

    // Create service role client to bypass RLS for admin operations
    console.log('🔵 Creating service role client to bypass RLS...')
    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false
        }
      }
    )
    console.log('✅ Service role client created')

    // Get overall statistics
    const now = new Date()
    const thirtyDaysAgo = new Date(now.getTime() - 30 * 24 * 60 * 60 * 1000)
    const sevenDaysAgo = new Date(now.getTime() - 7 * 24 * 60 * 60 * 1000)

    // Mark inactive users as offline first
    await supabaseAdmin.rpc('mark_inactive_users_offline')

    // Total users (all profiles) - using service role
    console.log('🔵 Fetching total users...')
    const { count: totalUsers } = await supabaseAdmin
      .from('profiles')
      .select('*', { count: 'exact', head: true })
    console.log('✅ Total users:', totalUsers)

    // New users (last 30 days) - using service role
    console.log('🔵 Fetching new users...')
    const { count: newUsers } = await supabaseAdmin
      .from('profiles')
      .select('*', { count: 'exact', head: true })
      .gte('created_at', thirtyDaysAgo.toISOString())
    console.log('✅ New users:', newUsers)

    // Active users (last 7 days) - using service role
    console.log('🔵 Fetching active users...')
    const { data: recentActivity } = await supabaseAdmin
      .from('user_activity_log')
      .select('user_id')
      .gte('created_at', sevenDaysAgo.toISOString())

    const activeUsers = new Set(recentActivity?.map(a => a.user_id)).size

    // Get online users count (currently active in last 5 minutes)
    console.log('🔵 Fetching online users count...')
    const { data: onlineData } = await supabaseAdmin
      .from('online_users_count')
      .select('*')
      .single()
    console.log('✅ Online users:', onlineData?.online_count || 0)

    // Total tests taken (use test_submissions table) - using service role
    console.log('🔵 Fetching total tests...')
    const { count: totalTests } = await supabaseAdmin
      .from('test_submissions')
      .select('*', { count: 'exact', head: true })
    console.log('✅ Total tests:', totalTests)

    // Tests taken (last 30 days) - using service role
    const { count: recentTests } = await supabaseAdmin
      .from('test_submissions')
      .select('*', { count: 'exact', head: true })
      .gte('submitted_at', thirtyDaysAgo.toISOString())
    console.log('✅ Recent tests:', recentTests)

    // Average score - using service role
    console.log('🔵 Calculating average score...')
    const { data: allTestResults } = await supabaseAdmin
      .from('test_submissions')
      .select('score')

    const averageScore = allTestResults && allTestResults.length > 0
      ? allTestResults.reduce((sum: number, test: any) => sum + test.score, 0) / allTestResults.length
      : 0

    // Total summaries - using service role
    const { count: totalSummaries } = await supabaseAdmin
      .from('summaries')
      .select('*', { count: 'exact', head: true })

    // Premium users - using service role
    const { count: premiumUsers } = await supabaseAdmin
      .from('profiles')
      .select('*', { count: 'exact', head: true })
      .eq('subscription_tier', 'pro')

    // Support messages (use contact_messages table) - using service role
    const { count: totalMessages } = await supabaseAdmin
      .from('contact_messages')
      .select('*', { count: 'exact', head: true })

    const { count: unreadMessages } = await supabaseAdmin
      .from('contact_messages')
      .select('*', { count: 'exact', head: true })
      .eq('status', 'unread')

    // User growth over last 12 months
    const userGrowth = []
    for (let i = 11; i >= 0; i--) {
      const monthStart = new Date(now.getFullYear(), now.getMonth() - i, 1)
      const monthEnd = new Date(now.getFullYear(), now.getMonth() - i + 1, 0)
      
      const { count } = await supabaseAdmin
        .from('profiles')
        .select('*', { count: 'exact', head: true })
        .gte('created_at', monthStart.toISOString())
        .lte('created_at', monthEnd.toISOString())

      userGrowth.push({
        month: monthStart.toLocaleString('default', { month: 'short', year: 'numeric' }),
        count: count || 0
      })
    }

    // Test activity over last 30 days
    const testActivity = []
    for (let i = 29; i >= 0; i--) {
      const dayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate() - i)
      const dayEnd = new Date(now.getFullYear(), now.getMonth(), now.getDate() - i + 1)
      
      const { count } = await supabaseAdmin
        .from('test_submissions')
        .select('*', { count: 'exact', head: true })
        .gte('submitted_at', dayStart.toISOString())
        .lt('submitted_at', dayEnd.toISOString())

      testActivity.push({
        date: dayStart.toISOString().split('T')[0],
        count: count || 0
      })
    }

    // Most popular courses - using service role
    console.log('🔵 Fetching popular courses...')
    const { data: testsByCourse } = await supabaseAdmin
      .from('test_submissions')
      .select(`
        course_id,
        courses (
          code,
          title
        )
      `)

    const courseCounts: { [key: string]: { count: number; title: string } } = {}
    testsByCourse?.forEach((test: any) => {
      const courseCode = test.courses?.code || 'Unknown'
      const title = test.courses?.title || 'Unknown'
      if (!courseCounts[courseCode]) {
        courseCounts[courseCode] = { count: 0, title }
      }
      courseCounts[courseCode].count += 1
    })

    const popularCourses = Object.entries(courseCounts)
      .map(([code, data]) => ({ code, title: data.title, count: data.count }))
      .sort((a, b) => b.count - a.count)
      .slice(0, 10)

    // Subscription revenue (if applicable) - using service role
    const { data: subscriptions } = await supabaseAdmin
      .from('subscriptions')
      .select('*')
      .eq('status', 'active')

    const monthlyRevenue = subscriptions?.length || 0 * 2000 // Assuming ₦2000 per subscription

    console.log('✅ Analytics data compiled successfully')
    console.log('📊 Overview:', { totalUsers, newUsers, activeUsers, totalTests })

    return new Response(
      JSON.stringify({
        overview: {
          totalUsers: totalUsers || 0,
          newUsers: newUsers || 0,
          activeUsers,
          onlineUsers: onlineData?.online_count || 0,
          active24h: onlineData?.active_24h || 0,
          active7d: onlineData?.active_7d || 0,
          premiumUsers: premiumUsers || 0,
          totalTests: totalTests || 0,
          recentTests: recentTests || 0,
          averageScore: Math.round(averageScore * 100) / 100,
          totalSummaries: totalSummaries || 0,
          totalMessages: totalMessages || 0,
          unreadMessages: unreadMessages || 0,
          monthlyRevenue,
        },
        charts: {
          userGrowth,
          testActivity,
          popularCourses,
        },
      }),
      {
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      }
    )
  } catch (error) {
    console.error('❌ FATAL ERROR:', error)
    console.error('❌ Error stack:', error.stack)
    return new Response(JSON.stringify({ 
      error: error.message,
      stack: error.stack,
      type: error.constructor.name
    }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    })
  }
})
