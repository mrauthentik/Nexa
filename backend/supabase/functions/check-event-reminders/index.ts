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
            Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ''
        );

        const now = new Date();
        console.log(`⏰ Checking reminders at ${now.toISOString()}`);
        
        // Get all events that haven't had reminders sent yet
        const { data: events, error: eventsError} = await supabase
            .from('calendar_events')
            .select('*')
            .eq('reminder_sent', false)
            .gte('date', now.toISOString().split('T')[0])
            .not('reminder_minutes', 'is', null);

        if (eventsError) throw eventsError;

        console.log(`📅 Found ${events?.length || 0} events with pending reminders`);

        const notificationsToCreate = [];
        const eventsToUpdate = [];

        for (const event of events || []) {
            // Construct event date-time
            const eventDateTime = new Date(`${event.date}T${event.start_time || '00:00'}`);
            const reminderTime = new Date(eventDateTime.getTime() - (event.reminder_minutes * 60000));

            console.log(`Event: ${event.title}, Event Time: ${eventDateTime}, Reminder Time: ${reminderTime}, Now: ${now}`);

            // Check if it's time to send reminder (within a 5-minute window)
            const timeDiff = reminderTime.getTime() - now.getTime();
            const shouldSendReminder = timeDiff <= 300000 && timeDiff >= -300000 && now < eventDateTime;

            if (shouldSendReminder) {
                console.log(`✅ Sending reminder for: ${event.title}`);
                
                // Calculate time until event
                const minutesUntil = Math.round((eventDateTime.getTime() - now.getTime()) / 60000);
                let timeMessage = '';
                
                if (minutesUntil >= 1440) {
                    timeMessage = 'tomorrow';
                } else if (minutesUntil >= 60) {
                    const hours = Math.floor(minutesUntil / 60);
                    timeMessage = `in ${hours} hour${hours > 1 ? 's' : ''}`;
                } else if (minutesUntil > 0) {
                    timeMessage = `in ${minutesUntil} minute${minutesUntil > 1 ? 's' : ''}`;
                } else {
                    timeMessage = 'now';
                }

                notificationsToCreate.push({
                    user_id: event.user_id,
                    type: 'announcement',
                    title: `⏰ Reminder: ${event.title}`,
                    message: `Your ${event.type} "${event.title}" is starting ${timeMessage}${event.location ? ` at ${event.location}` : ''}. ${event.description || ''}`.trim(),
                    read: false
                });

                eventsToUpdate.push(event.id);
            }
        }

        // Create all notifications
        if (notificationsToCreate.length > 0) {
            console.log(`📬 Creating ${notificationsToCreate.length} notifications`);
            
            const { error: notifError } = await supabase
                .from('notifications')
                .insert(notificationsToCreate);

            if (notifError) {
                console.error('Error creating notifications:', notifError);
                throw notifError;
            }

            // Mark reminders as sent
            for (const eventId of eventsToUpdate) {
                await supabase
                    .from('calendar_events')
                    .update({ reminder_sent: true })
                    .eq('id', eventId);
            }

            console.log(`✅ Successfully sent ${notificationsToCreate.length} reminders`);
        } else {
            console.log('ℹ️ No reminders to send at this time');
        }

        return new Response(
            JSON.stringify({ 
                success: true,
                checked_at: now.toISOString(),
                events_checked: events?.length || 0,
                reminders_sent: notificationsToCreate.length,
                details: notificationsToCreate.map(n => n.title)
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        console.error('❌ Error checking reminders:', error);
        return new Response(
            JSON.stringify({ 
                error: error.message,
                timestamp: new Date().toISOString()
            }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});
