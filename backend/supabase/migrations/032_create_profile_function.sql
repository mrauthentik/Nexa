-- Create a secure function to create/update profiles
-- This runs with SECURITY DEFINER to bypass RLS
CREATE OR REPLACE FUNCTION public.create_or_update_profile(
    p_user_id UUID,
    p_email TEXT,
    p_full_name TEXT,
    p_avatar_url TEXT DEFAULT NULL
)
RETURNS json AS $$
DECLARE
    v_profile json;
BEGIN
    INSERT INTO public.profiles (
        id,
        email,
        full_name,
        role,
        email_verified,
        avatar_url,
        subscription_tier,
        subscription_status,
        created_at,
        updated_at
    )
    VALUES (
        p_user_id,
        p_email,
        p_full_name,
        'student'::user_role,
        true,
        p_avatar_url,
        'free',
        'active',
        NOW(),
        NOW()
    )
    ON CONFLICT (id) DO UPDATE SET
        email = EXCLUDED.email,
        full_name = EXCLUDED.full_name,
        avatar_url = COALESCE(EXCLUDED.avatar_url, profiles.avatar_url),
        email_verified = true,
        updated_at = NOW()
    RETURNING row_to_json(profiles.*) INTO v_profile;
    
    RETURN v_profile;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Grant execute permission to authenticated users
GRANT EXECUTE ON FUNCTION public.create_or_update_profile(UUID, TEXT, TEXT, TEXT) TO authenticated;
GRANT EXECUTE ON FUNCTION public.create_or_update_profile(UUID, TEXT, TEXT, TEXT) TO anon;
