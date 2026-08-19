/**
 * ─────────────────────────────────────────────────────────────
 *  Shared Auth Middleware — NEXA Edge Functions
 * ─────────────────────────────────────────────────────────────
 * Provides server-side JWT validation and admin role checking.
 *
 * Security fix: Admin role was previously checked only on the
 * client (ProtectedRoute.tsx). Client-side checks are trivially
 * bypassable. All sensitive operations must be validated server-side.
 * ─────────────────────────────────────────────────────────────
 */
import { createClient } from "@supabase/supabase-js";

const SUPABASE_URL = Deno.env.get("SUPABASE_URL") ?? "";
const SUPABASE_ANON_KEY = Deno.env.get("SUPABASE_ANON_KEY") ?? "";
const SUPABASE_SERVICE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? "";

export interface AuthResult {
    userId: string;
    email: string;
    role: "student" | "admin";
    isAdmin: boolean;
}

export interface AuthError {
    error: string;
    status: number;
}

/**
 * Validate a JWT from the Authorization header and return user info.
 * Uses the anon key so RLS is still applied for any subsequent queries.
 *
 * @returns AuthResult on success, AuthError on failure
 */
export const validateAuth = async (
    req: Request
): Promise<AuthResult | AuthError> => {
    const authHeader = req.headers.get("Authorization");
    if (!authHeader?.startsWith("Bearer ")) {
        return { error: "Missing or invalid Authorization header", status: 401 };
    }

    const token = authHeader.replace("Bearer ", "");

    // Create a client scoped to this user's token
    const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
        global: { headers: { Authorization: `Bearer ${token}` } },
    });

    // Validate the token by fetching the user
    const { data: { user }, error: userError } = await supabase.auth.getUser(token);

    if (userError || !user) {
        return { error: "Invalid or expired token", status: 401 };
    }

    // Fetch the profile to get the role
    const { data: profile, error: profileError } = await supabase
        .from("profiles")
        .select("role")
        .eq("id", user.id)
        .single();

    if (profileError || !profile) {
        return { error: "User profile not found", status: 403 };
    }

    return {
        userId: user.id,
        email: user.email ?? "",
        role: profile.role,
        isAdmin: profile.role === "admin",
    };
};

/**
 * Require admin role. Returns an error response if the user is not admin.
 * Use this in Edge Functions that serve admin-only endpoints.
 *
 * Usage:
 *   const auth = await requireAdmin(req, corsHeaders);
 *   if (auth instanceof Response) return auth;
 *   // auth.userId, auth.isAdmin are now available
 */
export const requireAdmin = async (
    req: Request,
    responseHeaders: Record<string, string>
): Promise<AuthResult | Response> => {
    const result = await validateAuth(req);

    if ("error" in result) {
        return new Response(
            JSON.stringify({ error: result.error }),
            {
                status: result.status,
                headers: { ...responseHeaders, "Content-Type": "application/json" },
            }
        );
    }

    if (!result.isAdmin) {
        return new Response(
            JSON.stringify({ error: "Admin privileges required" }),
            {
                status: 403,
                headers: { ...responseHeaders, "Content-Type": "application/json" },
            }
        );
    }

    return result;
};

/**
 * Require authenticated user (any role).
 * Returns an error response if the token is invalid.
 */
export const requireAuth = async (
    req: Request,
    responseHeaders: Record<string, string>
): Promise<AuthResult | Response> => {
    const result = await validateAuth(req);

    if ("error" in result) {
        return new Response(
            JSON.stringify({ error: result.error }),
            {
                status: result.status,
                headers: { ...responseHeaders, "Content-Type": "application/json" },
            }
        );
    }

    return result;
};

/**
 * Create a Supabase client with service role key.
 * Use ONLY in Edge Functions for operations that need to bypass RLS
 * (e.g., reading all subscriptions for a webhook handler).
 * NEVER expose the service role key to the client.
 */
export const createServiceClient = () => {
    return createClient(SUPABASE_URL, SUPABASE_SERVICE_KEY);
};

/**
 * Create a Supabase client scoped to the authenticated user.
 * RLS policies will be applied based on the user's JWT.
 */
export const createUserClient = (token: string) => {
    return createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
        global: { headers: { Authorization: `Bearer ${token}` } },
    });
};
