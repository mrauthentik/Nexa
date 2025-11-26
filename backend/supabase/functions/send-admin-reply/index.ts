import { serve } from 'https://deno.land/std@0.168.0/http/server.ts';
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const RESEND_API_KEY = 're_R2QNjfBq_EK68vtTviLJ6nVHMZvoJyKxY';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

serve(async (req: Request) => {
  // Handle CORS
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    const { messageId, replyMessage } = await req.json();

    console.log('=== ADMIN REPLY EMAIL ===');
    console.log('Message ID:', messageId);

    if (!messageId || !replyMessage) {
      return new Response(
        JSON.stringify({ error: 'Message ID and reply message are required' }),
        { status: 400, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Create Supabase client
    const supabaseClient = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_ANON_KEY') ?? '',
      {
        global: {
          headers: { Authorization: req.headers.get('Authorization')! },
        },
      }
    );

    // Verify admin
    const { data: { user }, error: userError } = await supabaseClient.auth.getUser();
    
    if (userError || !user) {
      return new Response(
        JSON.stringify({ error: 'Unauthorized' }),
        { status: 401, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Check if user is admin
    const { data: profile } = await supabaseClient
      .from('profiles')
      .select('role')
      .eq('id', user.id)
      .single();

    if (!profile || profile.role !== 'admin') {
      return new Response(
        JSON.stringify({ error: 'Unauthorized - Admin only' }),
        { status: 403, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    // Get the original message
    const { data: message, error: messageError } = await supabaseClient
      .from('contact_messages')
      .select('*')
      .eq('id', messageId)
      .single();

    if (messageError || !message) {
      return new Response(
        JSON.stringify({ error: 'Message not found' }),
        { status: 404, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

    console.log('Sending reply email to:', message.email);

    // Send email via Resend
    try {
      const resendResponse = await fetch('https://api.resend.com/emails', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${RESEND_API_KEY}`,
        },
        body: JSON.stringify({
          from: 'NEXA Support <noreply@nexaedu.ng>',
          to: [message.email],
          subject: `Re: ${message.subject}`,
          html: `
            <!DOCTYPE html>
            <html>
              <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Reply from NEXA Support</title>
              </head>
              <body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f3f4f6;">
                <table width="100%" cellpadding="0" cellspacing="0" style="background-color: #f3f4f6; padding: 40px 20px;">
                  <tr>
                    <td align="center">
                      <table width="600" cellpadding="0" cellspacing="0" style="background-color: #ffffff; border-radius: 12px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); overflow: hidden;">
                        <!-- Header -->
                        <tr>
                          <td style="background: linear-gradient(135deg, #101829 0%, #1a2744 100%); padding: 40px 30px; text-align: center;">
                            <h1 style="margin: 0; color: #ffffff; font-size: 28px; font-weight: 700;">NEXA Support</h1>
                            <p style="margin: 10px 0 0; color: #e5e7eb; font-size: 14px;">We're here to help!</p>
                          </td>
                        </tr>
                        
                        <!-- Content -->
                        <tr>
                          <td style="padding: 40px 30px;">
                            <h2 style="margin: 0 0 20px; color: #111827; font-size: 24px; font-weight: 600;">Hello ${message.name},</h2>
                            <p style="margin: 0 0 20px; color: #4b5563; font-size: 16px; line-height: 1.6;">
                              Thank you for contacting NEXA Support. We've received your message and here's our response:
                            </p>
                            
                            <!-- Original Message -->
                            <div style="background-color: #f9fafb; border-left: 4px solid #14b8a6; padding: 20px; margin: 20px 0; border-radius: 8px;">
                              <p style="margin: 0 0 10px; color: #6b7280; font-size: 12px; font-weight: 600; text-transform: uppercase;">Your Message:</p>
                              <p style="margin: 0; color: #374151; font-size: 14px; line-height: 1.6;">
                                ${message.message.replace(/\n/g, '<br>')}
                              </p>
                            </div>
                            
                            <!-- Reply -->
                            <div style="background-color: #ecfdf5; border-left: 4px solid #10b981; padding: 20px; margin: 20px 0; border-radius: 8px;">
                              <p style="margin: 0 0 10px; color: #065f46; font-size: 12px; font-weight: 600; text-transform: uppercase;">Our Response:</p>
                              <p style="margin: 0; color: #064e3b; font-size: 16px; line-height: 1.6; white-space: pre-wrap;">
                                ${replyMessage.replace(/\n/g, '<br>')}
                              </p>
                            </div>
                            
                            <p style="margin: 20px 0 0; color: #4b5563; font-size: 16px; line-height: 1.6;">
                              If you have any further questions, feel free to reply to this email or contact us through our support page.
                            </p>
                            
                            <!-- CTA Button -->
                            <table width="100%" cellpadding="0" cellspacing="0" style="margin: 30px 0;">
                              <tr>
                                <td align="center">
                                  <a href="https://nexaedu.ng/contact" style="display: inline-block; padding: 14px 32px; background: linear-gradient(135deg, #14b8a6 0%, #0d9488 100%); color: #ffffff; text-decoration: none; border-radius: 8px; font-weight: 600; font-size: 16px;">
                                    Visit Support Page
                                  </a>
                                </td>
                              </tr>
                            </table>
                          </td>
                        </tr>
                        
                        <!-- Footer -->
                        <tr>
                          <td style="background-color: #f9fafb; padding: 30px; text-align: center; border-top: 1px solid #e5e7eb;">
                            <p style="margin: 0 0 10px; color: #6b7280; font-size: 14px;">
                              © 2025 NEXA. All rights reserved.
                            </p>
                            <p style="margin: 0; color: #9ca3af; font-size: 12px;">
                              Building Leaders, One Test at a Time.
                            </p>
                            <p style="margin: 10px 0 0; color: #9ca3af; font-size: 12px;">
                              This is an automated message from NEXA Support.
                            </p>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </body>
            </html>
          `,
        }),
      });

      const resendData = await resendResponse.json();
      
      if (!resendResponse.ok) {
        console.error('Resend API error:', JSON.stringify(resendData, null, 2));
        throw new Error(`Failed to send email: ${resendData.message || 'Unknown error'}`);
      }

      console.log('Reply email sent successfully:', resendData.id);

      // Update message in database
      const { error: updateError } = await supabaseClient
        .from('contact_messages')
        .update({
          status: 'replied',
          admin_notes: replyMessage,
          replied_at: new Date().toISOString(),
        })
        .eq('id', messageId);

      if (updateError) {
        console.error('Error updating message:', updateError);
        throw new Error('Failed to update message status');
      }

      return new Response(
        JSON.stringify({ 
          success: true, 
          message: 'Reply sent successfully',
          email_id: resendData.id
        }),
        { status: 200, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    } catch (emailError) {
      console.error('Email sending error:', emailError);
      return new Response(
        JSON.stringify({ error: 'Failed to send reply email' }),
        { status: 500, headers: { ...corsHeaders, 'Content-Type': 'application/json' } }
      );
    }

  } catch (error: unknown) {
    const errorMessage = error instanceof Error ? error.message : 'Unknown error';
    console.error('Function error:', errorMessage);
    
    return new Response(
      JSON.stringify({ error: errorMessage }),
      { 
        status: 500, 
        headers: { ...corsHeaders, 'Content-Type': 'application/json' } 
      }
    );
  }
});
