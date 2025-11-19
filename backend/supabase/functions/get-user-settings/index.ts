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

        const { data: { user }, error: authError } = await supabase.auth.getUser();
        if (authError || !user) {
            return new Response(
                JSON.stringify({ error: 'Unauthorized' }),
                { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // Get user settings
        const { data: settings, error } = await supabase
            .from('user_settings')
            .select('*')
            .eq('user_id', user.id)
            .single();

        // If no settings exist, return defaults
        if (error && error.code === 'PGRST116') {
            return new Response(
                JSON.stringify({
                    notifications: {
                        emailNotifications: true,
                        testReminders: true,
                        scoreUpdates: true,
                        systemUpdates: false
                    },
                    preferences: {
                        language: 'en',
                        timezone: 'Africa/Lagos',
                        theme: 'light'
                    }
                }),
                { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        if (error) throw error;

        // Format response
        const response = {
            notifications: {
                emailNotifications: settings.email_notifications,
                testReminders: settings.test_reminders,
                scoreUpdates: settings.score_updates,
                systemUpdates: settings.system_updates
            },
            preferences: {
                language: settings.language,
                timezone: settings.timezone,
                theme: settings.theme
            }
        };

        return new Response(
            JSON.stringify(response),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Error fetching settings:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
