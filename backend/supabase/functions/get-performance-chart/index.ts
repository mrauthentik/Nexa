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
        console.log('🚀 get-performance-chart endpoint called');
        console.log('📋 Request URL:', req.url);
        console.log('📋 Request method:', req.method);
        
        const url = new URL(req.url);
        const userId = url.searchParams.get('user_id');
        const period = url.searchParams.get('period') || '7'; // Default 7 days
        const days = parseInt(period);

        console.log('📊 Parameters received - userId:', userId, 'period:', period);

        if (!userId) {
            console.error('❌ Missing user_id parameter');
            return new Response(
                JSON.stringify({ error: 'user_id parameter is required' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        console.log('📊 Fetching performance chart for user:', userId, 'period:', days);

        const supabase = createClient(
            Deno.env.get("SUPABASE_URL") ?? '',
            Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? '',
        );

        console.log('🔍 Querying test_submissions table...');

        // Get all test submissions
        const { data: submissions, error: submissionsError } = await supabase
            .from('test_submissions')
            .select('score, submitted_at')
            .eq('user_id', userId)
            .order('submitted_at', { ascending: true });

        if (submissionsError) {
            console.error('❌ Database error:', submissionsError);
            throw submissionsError;
        }

        console.log('✅ Query successful! Found', submissions?.length || 0, 'test submissions');

        // Calculate stats
        const scores = submissions?.map(s => s.score || 0) || [];
        const highestScore = scores.length > 0 ? Math.max(...scores) : 0;
        const averageScore = scores.length > 0 
            ? Math.round(scores.reduce((sum, s) => sum + s, 0) / scores.length)
            : 0;

        // Calculate improvement (compare last 3 tests vs previous 3)
        let improvement = 0;
        if (scores.length >= 6) {
            const recent3 = scores.slice(-3);
            const previous3 = scores.slice(-6, -3);
            const recentAvg = recent3.reduce((sum, s) => sum + s, 0) / 3;
            const previousAvg = previous3.reduce((sum, s) => sum + s, 0) / 3;
            improvement = Math.round(recentAvg - previousAvg);
        } else if (scores.length >= 2) {
            // If less than 6 tests, compare last test with first test
            improvement = scores[scores.length - 1] - scores[0];
        }

        // Generate chart data for the specified period
        const chartData = [];
        const now = new Date();
        
        for (let i = days - 1; i >= 0; i--) {
            const date = new Date(now);
            date.setDate(date.getDate() - i);
            date.setHours(0, 0, 0, 0);
            
            const nextDate = new Date(date);
            nextDate.setDate(nextDate.getDate() + 1);
            
            const dateStr = date.toISOString().split('T')[0];
            const dayName = date.toLocaleDateString('en-US', { weekday: 'short' });
            
            // Find tests for this day
            const dayTests = submissions?.filter(s => {
                const testDate = new Date(s.submitted_at);
                return testDate >= date && testDate < nextDate;
            }) || [];
            
            const avgScore = dayTests.length > 0
                ? Math.round(dayTests.reduce((sum, s) => sum + (s.score || 0), 0) / dayTests.length)
                : 0;
            
            chartData.push({
                date: dateStr,
                day: dayName,
                score: avgScore,
                tests: dayTests.length,
                hasData: dayTests.length > 0
            });
        }

        // Get best score info
        let bestScoreDate = null;
        if (submissions && submissions.length > 0) {
            const bestSubmission = submissions.reduce((best, current) => 
                (current.score || 0) > (best.score || 0) ? current : best
            );
            bestScoreDate = new Date(bestSubmission.submitted_at).toLocaleDateString('en-US', { 
                month: 'short', 
                day: 'numeric' 
            });
        }

        const responseData = {
            stats: {
                highest: highestScore,
                average: averageScore,
                improvement: improvement,
                bestScoreDate: bestScoreDate
            },
            chartData: chartData,
            totalTests: submissions?.length || 0
        };

        console.log('📊 Calculated stats:', {
            highest: highestScore,
            average: averageScore,
            improvement: improvement,
            totalTests: submissions?.length || 0,
            chartDataPoints: chartData.length
        });

        console.log('✅ Returning response with', chartData.length, 'chart data points');

        return new Response(
            JSON.stringify(responseData),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('❌ ERROR in get-performance-chart:', error);
        console.error('❌ Error message:', error.message);
        console.error('❌ Error stack:', error.stack);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
