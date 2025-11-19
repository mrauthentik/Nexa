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

        const { courseId, score, percentage, timeTaken, answers, totalQuestions, correctAnswers } = await req.json();

        if (!courseId || score === undefined) {
            return new Response(
                JSON.stringify({ error: 'Course ID and score are required' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        console.log('📝 Submitting test:', {
            userId: user.id,
            courseId,
            score,
            totalQuestions,
            correctAnswers
        });

        // Save test submission with all analytics fields
        const { data: submission, error } = await supabase
            .from('test_submissions')
            .insert({
                user_id: user.id,
                course_id: courseId,
                score,
                percentage,
                time_taken: timeTaken,
                answers,
                total_questions: totalQuestions,
                correct_answers: correctAnswers,
                status: 'completed',
                submitted_at: new Date().toISOString()
            })
            .select()
            .single();

        console.log('✅ Test submission saved:', submission?.id);

        if (error) throw error;

        return new Response(
            JSON.stringify({ submission }),
            { status: 201, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Error submitting CBT test:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
