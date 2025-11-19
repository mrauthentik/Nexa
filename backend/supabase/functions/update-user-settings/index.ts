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

        const { settingType, settings } = await req.json();

        if (!settingType || !settings) {
            return new Response(
                JSON.stringify({ error: 'Setting type and settings data are required' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // Check if user_settings record exists
        const { data: existingSettings } = await supabase
            .from('user_settings')
            .select('*')
            .eq('user_id', user.id)
            .single();

        let result;
        if (existingSettings) {
            // Update existing settings
            const updateData: any = {};
            
            if (settingType === 'notifications') {
                updateData.email_notifications = settings.emailNotifications;
                updateData.test_reminders = settings.testReminders;
                updateData.score_updates = settings.scoreUpdates;
                updateData.system_updates = settings.systemUpdates;
            } else if (settingType === 'preferences') {
                updateData.language = settings.language;
                updateData.timezone = settings.timezone;
                updateData.theme = settings.theme;
            }

            const { error } = await supabase
                .from('user_settings')
                .update(updateData)
                .eq('user_id', user.id);

            if (error) throw error;
            result = { message: 'Settings updated successfully' };
        } else {
            // Create new settings record
            const insertData: any = {
                user_id: user.id,
            };

            if (settingType === 'notifications') {
                insertData.email_notifications = settings.emailNotifications;
                insertData.test_reminders = settings.testReminders;
                insertData.score_updates = settings.scoreUpdates;
                insertData.system_updates = settings.systemUpdates;
            } else if (settingType === 'preferences') {
                insertData.language = settings.language;
                insertData.timezone = settings.timezone;
                insertData.theme = settings.theme;
            }

            const { error } = await supabase
                .from('user_settings')
                .insert(insertData);

            if (error) throw error;
            result = { message: 'Settings created successfully' };
        }

        return new Response(
            JSON.stringify(result),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('Error updating settings:', error);
        return new Response(
            JSON.stringify({ error: error.message }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
