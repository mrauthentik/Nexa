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
          from: 'NEXA Support Team <noreply@nexaedu.ng>',
          reply_to: 'noreply@nexaedu.ng',
          to: [message.email],
          subject: `✅ Response from NEXA Support: ${message.subject}`,
          html: `
            <!DOCTYPE html>
            <html lang="en">
              <head>
                <meta charset="utf-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <title>Response from NEXA Support</title>
                <!--[if mso]>
                <style type="text/css">
                  body, table, td {font-family: Arial, Helvetica, sans-serif !important;}
                </style>
                <![endif]-->
              </head>
              <body style="margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; background-color: #f0f4f8; -webkit-font-smoothing: antialiased; -moz-osx-font-smoothing: grayscale;">
                
                <!-- Preheader Text (Hidden but shows in email preview) -->
                <div style="display: none; max-height: 0; overflow: hidden; mso-hide: all;">
                  Your support request has been answered by the NEXA team. View your response inside.
                </div>
                
                <!-- Main Container -->
                <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color: #f0f4f8; padding: 40px 20px;">
                  <tr>
                    <td align="center">
                      
                      <!-- Email Card -->
                      <table role="presentation" width="600" cellpadding="0" cellspacing="0" border="0" style="max-width: 600px; background-color: #ffffff; border-radius: 16px; box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08); overflow: hidden;">
                        
                        <!-- Header with Logo and Brand -->
                        <tr>
                          <td style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #334155 100%); padding: 48px 40px; text-align: center; position: relative;">
                            <!-- Logo -->
                            <div style="margin-bottom: 16px;">
                              <svg width="80" height="80" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg" style="display: inline-block;">
                                <defs>
                                  <linearGradient id="logoGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                                    <stop offset="0%" style="stop-color:#14b8a6;stop-opacity:1" />
                                    <stop offset="100%" style="stop-color:#06b6d4;stop-opacity:1" />
                                  </linearGradient>
                                </defs>
                                <circle cx="50" cy="50" r="45" fill="url(#logoGradient)" opacity="0.2"/>
                                <text x="50" y="65" font-family="Arial, sans-serif" font-size="48" font-weight="bold" fill="url(#logoGradient)" text-anchor="middle">N</text>
                              </svg>
                            </div>
                            <h1 style="margin: 0; color: #ffffff; font-size: 32px; font-weight: 700; letter-spacing: -0.5px;">NEXA</h1>
                            <p style="margin: 8px 0 0; color: #94a3b8; font-size: 15px; font-weight: 500; letter-spacing: 0.5px;">SUPPORT TEAM</p>
                            <div style="margin-top: 20px; padding-top: 20px; border-top: 1px solid rgba(255, 255, 255, 0.1);">
                              <span style="display: inline-block; background: rgba(20, 184, 166, 0.15); color: #5eead4; padding: 6px 16px; border-radius: 20px; font-size: 13px; font-weight: 600; letter-spacing: 0.5px;">
                                ✓ VERIFIED RESPONSE
                              </span>
                            </div>
                          </td>
                        </tr>
                        
                        <!-- Main Content -->
                        <tr>
                          <td style="padding: 48px 40px;">
                            
                            <!-- Greeting -->
                            <h2 style="margin: 0 0 16px; color: #0f172a; font-size: 26px; font-weight: 700; line-height: 1.3;">
                              Hello ${message.name}! 👋
                            </h2>
                            <p style="margin: 0 0 28px; color: #475569; font-size: 16px; line-height: 1.7;">
                              Thank you for reaching out to <strong style="color: #14b8a6;">NEXA</strong>. Our support team has carefully reviewed your inquiry and prepared a response for you.
                            </p>
                            
                            <!-- Original Message Box -->
                            <div style="background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%); border-left: 5px solid #14b8a6; padding: 24px; margin: 28px 0; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);">
                              <div style="display: flex; align-items: center; margin-bottom: 12px;">
                                <span style="display: inline-block; width: 8px; height: 8px; background: #14b8a6; border-radius: 50%; margin-right: 8px;"></span>
                                <p style="margin: 0; color: #64748b; font-size: 12px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">YOUR INQUIRY</p>
                              </div>
                              <p style="margin: 0; color: #334155; font-size: 15px; line-height: 1.7; font-style: italic;">
                                "${message.message.replace(/\n/g, '<br>')}"
                              </p>
                            </div>
                            
                            <!-- Response Box -->
                            <div style="background: linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%); border-left: 5px solid #10b981; padding: 28px; margin: 28px 0; border-radius: 12px; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.15);">
                              <div style="display: flex; align-items: center; margin-bottom: 16px;">
                                <span style="display: inline-block; width: 10px; height: 10px; background: #10b981; border-radius: 50%; margin-right: 8px;"></span>
                                <p style="margin: 0; color: #065f46; font-size: 13px; font-weight: 700; text-transform: uppercase; letter-spacing: 1px;">OUR RESPONSE</p>
                              </div>
                              <div style="margin: 0; color: #064e3b; font-size: 16px; line-height: 1.8; font-weight: 500;">
                                ${replyMessage.replace(/\n/g, '<br>')}
                              </div>
                            </div>
                            
                            <!-- Important Notice -->
                            <div style="background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%); border: 2px solid #f59e0b; padding: 20px; margin: 32px 0; border-radius: 12px;">
                              <p style="margin: 0 0 8px; color: #92400e; font-size: 14px; font-weight: 700; display: flex; align-items: center;">
                                <span style="font-size: 20px; margin-right: 8px;">⚠️</span>
                                IMPORTANT NOTICE
                              </p>
                              <p style="margin: 0; color: #78350f; font-size: 14px; line-height: 1.6;">
                                <strong>Please do not reply to this email.</strong> This is an automated notification from a no-reply address. For any follow-up questions or new inquiries, please submit a new message through our official support page.
                              </p>
                            </div>
                            
                            <!-- Need More Help Section -->
                            <div style="background: #f8fafc; padding: 28px; margin: 32px 0; border-radius: 12px; text-align: center; border: 2px dashed #cbd5e1;">
                              <p style="margin: 0 0 20px; color: #475569; font-size: 15px; line-height: 1.6;">
                                <strong>Need more assistance?</strong><br>
                                Our support team is always ready to help you succeed.
                              </p>
                              <a href="https://nexaedu.ng/contact" style="display: inline-block; padding: 16px 40px; background: linear-gradient(135deg, #14b8a6 0%, #06b6d4 100%); color: #ffffff; text-decoration: none; border-radius: 10px; font-weight: 700; font-size: 16px; box-shadow: 0 4px 14px rgba(20, 184, 166, 0.4); transition: all 0.3s ease;">
                                📧 Contact Support
                              </a>
                              <p style="margin: 16px 0 0; color: #94a3b8; font-size: 13px;">
                                Average response time: 24-48 hours
                              </p>
                            </div>
                            
                            <!-- Signature -->
                            <div style="margin-top: 40px; padding-top: 28px; border-top: 2px solid #e2e8f0;">
                              <p style="margin: 0 0 8px; color: #0f172a; font-size: 15px; font-weight: 600;">
                                Best regards,
                              </p>
                              <p style="margin: 0; color: #14b8a6; font-size: 17px; font-weight: 700;">
                                The NEXA Support Team
                              </p>
                              <p style="margin: 8px 0 0; color: #64748b; font-size: 13px; font-style: italic;">
                                Building Leaders, One Test at a Time 🚀
                              </p>
                            </div>
                            
                          </td>
                        </tr>
                        
                        <!-- Footer -->
                        <tr>
                          <td style="background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%); padding: 40px; text-align: center; border-top: 3px solid #14b8a6;">
                            
                            <!-- Social Links -->
                            <div style="margin-bottom: 24px;">
                              <a href="https://nexaedu.ng" style="display: inline-block; margin: 0 8px; color: #64748b; text-decoration: none; font-size: 24px;">🌐</a>
                              <a href="https://twitter.com/NexaPlatform" style="display: inline-block; margin: 0 8px; color: #64748b; text-decoration: none; font-size: 24px;">🐦</a>
                              <a href="https://facebook.com/NexaPlatform" style="display: inline-block; margin: 0 8px; color: #64748b; text-decoration: none; font-size: 24px;">📘</a>
                              <a href="https://instagram.com/NexaPlatform" style="display: inline-block; margin: 0 8px; color: #64748b; text-decoration: none; font-size: 24px;">📸</a>
                            </div>
                            
                            <!-- Company Info -->
                            <p style="margin: 0 0 8px; color: #475569; font-size: 14px; font-weight: 600;">
                              NEXA Educational Platform
                            </p>
                            <p style="margin: 0 0 16px; color: #64748b; font-size: 13px; line-height: 1.6;">
                              Abuja, Nigeria<br>
                              <a href="https://nexaedu.ng" style="color: #14b8a6; text-decoration: none; font-weight: 600;">www.nexaedu.ng</a>
                            </p>
                            
                            <!-- Legal -->
                            <p style="margin: 0 0 8px; color: #94a3b8; font-size: 12px; line-height: 1.5;">
                              © 2025 NEXA. All rights reserved.
                            </p>
                            <p style="margin: 0; color: #cbd5e1; font-size: 11px; line-height: 1.5;">
                              This is an automated message from NEXA Support. Please do not reply to this email.<br>
                              For support inquiries, visit our <a href="https://nexaedu.ng/contact" style="color: #14b8a6; text-decoration: none;">Contact Page</a>.
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
