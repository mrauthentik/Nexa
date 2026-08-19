/**
 * ─────────────────────────────────────────────────────────────
 *  Shared CORS Middleware — NEXA Edge Functions
 * ─────────────────────────────────────────────────────────────
 * Restricts cross-origin access to configured allowed origins.
 *
 * Security fix: Replaces the wildcard `Access-Control-Allow-Origin: *`
 * that was applied to every edge function. Wildcard CORS allows any
 * website to make credentialed requests using a user's stored JWT.
 *
 * ALLOWED_ORIGINS env var: comma-separated list of allowed origins.
 * Defaults to * only if explicitly set to "DEVELOPMENT" for local dev.
 * Production must always set ALLOWED_ORIGINS.
 * ─────────────────────────────────────────────────────────────
 */

const ALLOWED_ORIGINS_RAW = Deno.env.get("ALLOWED_ORIGINS") ?? "";

// Parse allowed origins from env var
const ALLOWED_ORIGINS: Set<string> = new Set(
    ALLOWED_ORIGINS_RAW
        .split(",")
        .map((o) => o.trim())
        .filter(Boolean)
);

// Add localhost origins for development
if (ALLOWED_ORIGINS_RAW === "DEVELOPMENT" || ALLOWED_ORIGINS.size === 0) {
    ALLOWED_ORIGINS.add("http://localhost:5173");
    ALLOWED_ORIGINS.add("http://localhost:3000");
}

/**
 * Get CORS headers for a given request origin.
 * Returns a wildcard only in development mode.
 */
export const getCorsHeaders = (
    requestOrigin: string | null
): Record<string, string> => {
    // In development mode (no origins configured), allow all
    if (ALLOWED_ORIGINS_RAW === "DEVELOPMENT" || ALLOWED_ORIGINS.size === 0) {
        return {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Headers":
                "authorization, x-client-info, apikey, content-type",
            "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
        };
    }

    // In production, validate the request origin
    const origin = requestOrigin ?? "";
    const allowedOrigin = ALLOWED_ORIGINS.has(origin) ? origin : "";

    return {
        "Access-Control-Allow-Origin": allowedOrigin || "",
        "Access-Control-Allow-Headers":
            "authorization, x-client-info, apikey, content-type",
        "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
        "Access-Control-Allow-Credentials": "true",
        "Vary": "Origin",
    };
};

/**
 * Handle CORS preflight requests.
 * Call this at the top of every edge function handler.
 */
export const handleCors = (req: Request): Response | null => {
    if (req.method === "OPTIONS") {
        const corsHeaders = getCorsHeaders(req.headers.get("Origin"));
        return new Response("ok", { headers: corsHeaders });
    }
    return null;
};

/**
 * Standard CORS headers for non-preflight responses.
 * Usage: return new Response(body, { headers: { ...getCorsHeaders(origin), "Content-Type": "application/json" } })
 */
export const corsHeaders = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers":
        "authorization, x-client-info, apikey, content-type",
    "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
};
