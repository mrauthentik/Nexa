import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "@supabase/supabase-js";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req) => {
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        const supabase = createClient(
            Deno.env.get("SUPABASE_URL") ?? '',
            Deno.env.get("SUPABASE_ANON_KEY") ?? '',
            {
                global: {
                    headers: { Authorization: req.headers.get('Authorization')! },
                },
            }
        );

        // Get authenticated user
        const { data: { user }, error: authError } = await supabase.auth.getUser();
        if (authError || !user) {
            return new Response(
                JSON.stringify({ error: 'Unauthorized' }),
                { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // Get test submissions
        const { data: submissions, error: submissionsError } = await supabase
            .from('test_submissions')
            .select('*')
            .eq('user_id', user.id)
            .order('created_at', { ascending: false });

        if (submissionsError) throw submissionsError;

        // Calculate stats
        const totalTests = submissions?.length || 0;
        const averageScore = totalTests > 0
            ? Math.round(submissions.reduce((sum, s) => sum + (s.score || 0), 0) / totalTests)
            : 0;
        
        const passedTests = submissions?.filter(s => (s.score || 0) >= 50).length || 0;
        const failedTests = totalTests - passedTests;

        // Get recent submissions (last 7 days)
        const sevenDaysAgo = new Date();
        sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7);
        
        const recentSubmissions = submissions?.filter(s => 
            new Date(s.created_at) >= sevenDaysAgo
        ) || [];

        // Calculate daily progress (last 7 days)
        const dailyProgress = [];
        for (let i = 6; i >= 0; i--) {
            const date = new Date();
            date.setDate(date.getDate() - i);
            const dateStr = date.toISOString().split('T')[0];
            
            const daySubmissions = submissions?.filter(s => 
                s.created_at.startsWith(dateStr)
            ) || [];
            
            const avgScore = daySubmissions.length > 0
                ? Math.round(daySubmissions.reduce((sum, s) => sum + (s.score || 0), 0) / daySubmissions.length)
                : 0;
            
            dailyProgress.push({
                date: dateStr,
                score: avgScore,
                tests: daySubmissions.length
            });
        }

        // Get study time from summaries viewed
        const { data: summaryViews } = await supabase
            .from('summary_views')
            .select('viewed_at')
            .eq('user_id', user.id)
            .gte('viewed_at', sevenDaysAgo.toISOString());

        const totalStudyTime = (summaryViews?.length || 0) * 5; // Assume 5 min per summary

        // Get upcoming events
        const today = new Date().toISOString().split('T')[0];
        const { data: upcomingEvents } = await supabase
            .from('calendar_events')
            .select('*')
            .eq('user_id', user.id)
            .gte('date', today)
            .order('date', { ascending: true })
            .limit(5);

        // Get course performance
        const coursePerformance = [];
        const courseGroups = submissions?.reduce((acc: any, sub) => {
            const courseId = sub.course_id;
            if (!acc[courseId]) {
                acc[courseId] = [];
            }
            acc[courseId].push(sub);
            return acc;
        }, {}) || {};

        for (const [courseId, courseSubs] of Object.entries(courseGroups)) {
            const subs = courseSubs as any[];
            const avgScore = Math.round(subs.reduce((sum, s) => sum + (s.score || 0), 0) / subs.length);
            
            // Get course details
            const { data: course } = await supabase
                .from('courses')
                .select('code, title')
                .eq('id', courseId)
                .single();

            coursePerformance.push({
                courseId,
                courseCode: course?.code || 'Unknown',
                courseTitle: course?.title || 'Unknown Course',
                averageScore: avgScore,
                testsCompleted: subs.length,
                lastAttempt: subs[0].created_at
            });
        }

        // Sort by last attempt
        coursePerformance.sort((a, b) => 
            new Date(b.lastAttempt).getTime() - new Date(a.lastAttempt).getTime()
        );

        return new Response(
            JSON.stringify({
                overview: {
                    totalTests,
                    averageScore,
                    passedTests,
                    failedTests,
                    totalStudyTime,
                    recentTests: recentSubmissions.length
                },
                dailyProgress,
                coursePerformance: coursePerformance.slice(0, 5),
                upcomingEvents: upcomingEvents || [],
                recentSubmissions: submissions?.slice(0, 5) || []
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Error fetching dashboard stats:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
