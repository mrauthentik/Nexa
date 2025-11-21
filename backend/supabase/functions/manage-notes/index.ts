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
        const { data: { user }, error: userError } = await supabase.auth.getUser();
        if (userError || !user) {
            return new Response(
                JSON.stringify({ error: 'Unauthorized' }),
                { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const url = new URL(req.url);
        const method = req.method;
        const summaryId = url.searchParams.get('summary_id');

        // GET - Fetch note for a summary
        if (method === 'GET') {
            if (!summaryId) {
                return new Response(
                    JSON.stringify({ error: 'Summary ID is required' }),
                    { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
                );
            }

            const { data, error } = await supabase
                .from('user_notes')
                .select('*')
                .eq('user_id', user.id)
                .eq('summary_id', summaryId)
                .single();

            if (error && error.code !== 'PGRST116') throw error;

            return new Response(
                JSON.stringify({ note: data || null }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // POST - Create or update note
        if (method === 'POST') {
            const body = await req.json();
            const { summary_id, content, highlights, formatting } = body;

            if (!summary_id || !content) {
                return new Response(
                    JSON.stringify({ error: 'Summary ID and content are required' }),
                    { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
                );
            }

            const { data, error } = await supabase
                .from('user_notes')
                .upsert({
                    user_id: user.id,
                    summary_id,
                    content,
                    highlights: highlights || [],
                    formatting: formatting || {}
                }, {
                    onConflict: 'user_id,summary_id'
                })
                .select()
                .single();

            if (error) throw error;

            return new Response(
                JSON.stringify({ note: data, message: 'Note saved successfully' }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // DELETE - Delete note
        if (method === 'DELETE') {
            if (!summaryId) {
                return new Response(
                    JSON.stringify({ error: 'Summary ID is required' }),
                    { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
                );
            }

            const { error } = await supabase
                .from('user_notes')
                .delete()
                .eq('user_id', user.id)
                .eq('summary_id', summaryId);

            if (error) throw error;

            return new Response(
                JSON.stringify({ message: 'Note deleted successfully' }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        return new Response(
            JSON.stringify({ error: 'Method not allowed' }),
            { status: 405, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );

    } catch (error) {
        console.error('Error managing notes:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
