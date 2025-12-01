import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "@supabase/supabase-js";

const corsHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Helper function for structured logging
function log(level: string, message: string, data?: any) {
    const timestamp = new Date().toISOString();
    const logEntry = {
        timestamp,
        level,
        function: 'signup',
        message,
        ...(data && { data })
    };
    console.log(JSON.stringify(logEntry));
}

serve(async (req) => {
    const requestId = crypto.randomUUID();
    log('INFO', 'Signup request received', { requestId, method: req.method });

    // Handle CORS preflight requests
    if (req.method === 'OPTIONS') {
        log('INFO', 'CORS preflight request', { requestId });
        return new Response('ok', { headers: corsHeaders });
    }

    try {
        // Parse request body
        let body;
        try {
            body = await req.json();
            log('INFO', 'Request body parsed', { requestId, email: body.email, role: body.role });
        } catch (parseError) {
            log('ERROR', 'Failed to parse request body', { 
                requestId, 
                error: parseError.message,
                stack: parseError.stack 
            });
            return new Response(
                JSON.stringify({ error: 'Invalid JSON in request body' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        const { email, password, fullName, role } = body;

        // Validate required fields
        if (!email || !password || !fullName) {
            log('WARN', 'Missing required fields', { 
                requestId, 
                hasEmail: !!email, 
                hasPassword: !!password, 
                hasFullName: !!fullName 
            });
            return new Response(
                JSON.stringify({ error: 'Email, password, and full name are required' }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        log('INFO', 'Creating Supabase client', { requestId });
        const supabase = createClient(
            Deno.env.get("SUPABASE_URL") ?? '',
            Deno.env.get("SUPABASE_ANON_KEY") ?? ''
        );

        log('INFO', 'Attempting user signup', { 
            requestId, 
            email, 
            fullName, 
            role: role || 'student' 
        });

        const { data, error } = await supabase.auth.signUp({
            email,
            password,
            options: {
                data: {
                    fullName,
                    role: role || 'student'
                }
            }
        });

        if (error) {
            log('ERROR', 'Supabase signup error', { 
                requestId,
                email,
                errorMessage: error.message,
                errorName: error.name,
                errorStatus: error.status,
                errorCode: error.code,
                fullError: JSON.stringify(error)
            });
            return new Response(
                JSON.stringify({ error: error.message }),
                { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
            );
        }

        // Check if user and profile were created
        if (data?.user) {
            log('INFO', 'User created successfully', { 
                requestId,
                userId: data.user.id,
                email: data.user.email,
                hasSession: !!data.session
            });

            // Verify profile was created
            try {
                const { data: profile, error: profileError } = await supabase
                    .from('profiles')
                    .select('id, email, full_name, role')
                    .eq('id', data.user.id)
                    .single();

                if (profileError) {
                    log('ERROR', 'Profile verification failed', {
                        requestId,
                        userId: data.user.id,
                        email: data.user.email,
                        profileError: profileError.message,
                        profileErrorCode: profileError.code,
                        fullProfileError: JSON.stringify(profileError)
                    });
                } else if (profile) {
                    log('INFO', 'Profile verified successfully', {
                        requestId,
                        userId: data.user.id,
                        profileId: profile.id,
                        profileRole: profile.role
                    });
                } else {
                    log('WARN', 'Profile not found after signup', {
                        requestId,
                        userId: data.user.id,
                        email: data.user.email
                    });
                }
            } catch (verifyError) {
                log('ERROR', 'Profile verification exception', {
                    requestId,
                    userId: data.user.id,
                    error: verifyError.message,
                    stack: verifyError.stack
                });
            }
        } else {
            log('WARN', 'Signup succeeded but no user data returned', { requestId });
        }

        log('INFO', 'Signup completed successfully', { requestId, userId: data?.user?.id });
        return new Response(
            JSON.stringify({ data }),
            { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    } catch (error) {
        log('ERROR', 'Unexpected error in signup function', { 
            requestId,
            error: error.message,
            errorName: error.name,
            stack: error.stack,
            fullError: JSON.stringify(error, Object.getOwnPropertyNames(error))
        });
        return new Response(
            JSON.stringify({ 
                error: error.message || 'An unexpected error occurred',
                requestId 
            }),
            { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
        );
    }
});