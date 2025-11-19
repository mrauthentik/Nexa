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

        const url = new URL(req.url);
        const isActive = url.searchParams.get('isActive');
        const level = url.searchParams.get('level');
        const department = url.searchParams.get('department');
        const semester = url.searchParams.get('semester');

        // Build query
        let query = supabase
            .from('courses')
            .select('*')
            .order('level', { ascending: true })
            .order('code', { ascending: true });

        // Apply filters
        if (isActive !== null) {
            query = query.eq('is_active', isActive === 'true');
        }
        if (level) {
            query = query.eq('level', level);
        }
        if (department) {
            query = query.eq('department', department);
        }
        if (semester) {
            query = query.eq('semester', parseInt(semester));
        }

        const { data: courses, error } = await query;

        if (error) throw error;

        return new Response(
            JSON.stringify({ courses: courses || [] }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Error fetching courses:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
