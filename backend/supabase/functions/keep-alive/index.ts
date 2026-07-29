import { serve } from "https://deno.land/std@0.168.0/http/server.ts";
import { createClient } from "@supabase/supabase-js";

/**
 * 🏓 NEXA Keep-Alive Edge Function
 *
 * Prevents Supabase from pausing the project due to inactivity.
 * This function should be called by an external cron scheduler (e.g., cron-job.org)
 * every 5 days to keep the database active.
 *
 * Supabase free tier pauses after 7 days of inactivity — pinging every 5 days is safe.
 *
 * Setup Guide:
 *  1. Deploy this function: supabase functions deploy keep-alive --no-verify-jwt
 *  2. Get your function URL from the Supabase dashboard > Edge Functions
 *  3. Create a free cron job at https://cron-job.org pointing to this URL
 *  4. Set the cron schedule to run every 5 days (or every day for extra safety)
 *  5. Optionally add KEEP_ALIVE_SECRET to your Supabase project env vars for security
 */

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers":
    "authorization, x-client-info, apikey, content-type, x-keep-alive-secret",
};

serve(async (req) => {
  // Handle CORS preflight
  if (req.method === "OPTIONS") {
    return new Response("ok", { headers: corsHeaders });
  }

  const startTime = Date.now();

  try {
    // ── Optional Secret Guard ─────────────────────────────────────────────
    // If you set KEEP_ALIVE_SECRET in your Supabase project env vars,
    // the cron job must include the header: x-keep-alive-secret: <your-secret>
    const secret = Deno.env.get("KEEP_ALIVE_SECRET");
    if (secret) {
      const providedSecret = req.headers.get("x-keep-alive-secret");
      if (providedSecret !== secret) {
        console.warn("⚠️ Keep-alive called with invalid secret");
        return new Response(
          JSON.stringify({ error: "Unauthorized" }),
          {
            status: 401,
            headers: { ...corsHeaders, "Content-Type": "application/json" },
          }
        );
      }
    }

    // ── Database Ping ─────────────────────────────────────────────────────
    const supabase = createClient(
      Deno.env.get("SUPABASE_URL") ?? "",
      Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    );

    const now = new Date();
    console.log(`🏓 Keep-alive ping received at ${now.toISOString()}`);

    // Lightweight query — just fetch the DB server timestamp
    const { data, error } = await supabase.rpc("now");

    // Fallback: if the rpc call fails, do a minimal table select
    let dbTime: string;
    let method: string;

    if (error || !data) {
      console.log("ℹ️ RPC fallback — trying table query...");
      const { data: fallbackData, error: fallbackError } = await supabase
        .from("profiles")
        .select("id")
        .limit(1);

      if (fallbackError) {
        throw new Error(`DB ping failed: ${fallbackError.message}`);
      }

      dbTime = now.toISOString();
      method = "table_query";
      console.log("✅ DB ping successful via table query");
    } else {
      dbTime = typeof data === "string" ? data : now.toISOString();
      method = "rpc_now";
      console.log(`✅ DB ping successful via RPC. DB time: ${dbTime}`);
    }

    const elapsed = Date.now() - startTime;

    return new Response(
      JSON.stringify({
        success: true,
        message: "🏓 NEXA database is alive and active!",
        pinged_at: now.toISOString(),
        db_time: dbTime,
        method,
        response_ms: elapsed,
        project: "NEXA - NOUN Exam Experience Assistant",
      }),
      {
        status: 200,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  } catch (error) {
    const elapsed = Date.now() - startTime;
    console.error("❌ Keep-alive error:", error);

    return new Response(
      JSON.stringify({
        success: false,
        error: error.message,
        timestamp: new Date().toISOString(),
        response_ms: elapsed,
      }),
      {
        status: 500,
        headers: { ...corsHeaders, "Content-Type": "application/json" },
      }
    );
  }
});
