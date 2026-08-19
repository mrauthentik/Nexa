import { serve } from 'https://deno.land/std@0.168.0/http/server.ts'
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2'
import { checkRateLimit, RateLimitConfigs, rateLimitedResponse } from '../_shared/rateLimiter.ts'
import { corsHeaders } from '../_shared/corsHeaders.ts'

serve(async (req) => {
    // Handle CORS preflight requests
    if (req.method === 'OPTIONS') {
        return new Response('ok', { headers: corsHeaders })
    }

    try {
        // ── Rate Limiting ────────────────────────────────────────────────────
        // This is a public (unauthenticated) endpoint — bots can spam it.
        // Limit by IP: 3 contact submissions per hour per IP address.
        const clientIp =
            req.headers.get('x-forwarded-for')?.split(',')[0]?.trim() ??
            req.headers.get('x-real-ip') ??
            'unknown';

        const rateCheck = checkRateLimit(`contact:${clientIp}`, RateLimitConfigs.CONTACT);
        if (!rateCheck.allowed) {
            return rateLimitedResponse(corsHeaders, rateCheck.resetAt);
        }

        // Use service role key to bypass RLS for public contact form submissions
        const supabaseClient = createClient(
            Deno.env.get('SUPABASE_URL') ?? '',
            Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
            {
                auth: {
                    autoRefreshToken: false,
                    persistSession: false
                }
            }
        )

        let body: { name?: string; email?: string; subject?: string; message?: string };
        try {
            body = await req.json();
        } catch {
            return new Response(
                JSON.stringify({ error: 'Invalid JSON body' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const { name, email, subject, message } = body;

        // Validate required fields
        if (!name || !email || !subject || !message) {
            return new Response(
                JSON.stringify({ error: 'All fields are required' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            )
        }

        // Validate email format
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
        if (!emailRegex.test(email)) {
            return new Response(
                JSON.stringify({ error: 'Invalid email format' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            )
        }

        // Validate field lengths — prevent oversized payloads
        if (name.length > 255 || email.length > 255 || subject.length > 500 || message.length > 5000) {
            return new Response(
                JSON.stringify({ error: 'Field length exceeded' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            )
        }

        // Sanitize inputs — basic HTML stripping to prevent XSS in admin view
        const sanitize = (str: string) => str.replace(/<[^>]*>/g, '').trim();

        // Insert contact message
        const { data, error } = await supabaseClient
            .from('support_messages')
            .insert([
                {
                    name: sanitize(name),
                    email: sanitize(email).toLowerCase(),
                    subject: sanitize(subject),
                    message: sanitize(message),
                    status: 'unread'
                }
            ])
            .select('id, name, email, subject, created_at')
            .single()

        if (error) throw error

        return new Response(
            JSON.stringify({
                success: true,
                message: 'Your message has been sent successfully. We will get back to you soon!',
                id: data.id,
            }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )

    } catch (error: any) {
        return new Response(
            JSON.stringify({ error: error.message || 'Failed to submit message' }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        )
    }
})
