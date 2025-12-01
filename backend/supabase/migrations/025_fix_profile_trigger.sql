-- =====================================================
-- FIX PROFILE CREATION TRIGGER
-- Ensures the trigger works regardless of column existence
-- =====================================================

-- Drop and recreate the trigger function with dynamic column handling
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
DECLARE
  has_subscription_tier BOOLEAN;
  has_subscription_status BOOLEAN;
BEGIN
  -- Check if subscription columns exist
  SELECT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_schema = 'public' 
    AND table_name = 'profiles' 
    AND column_name = 'subscription_tier'
  ) INTO has_subscription_tier;
  
  SELECT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_schema = 'public'
    AND table_name = 'profiles' 
    AND column_name = 'subscription_status'
  ) INTO has_subscription_status;
  
  -- Insert with columns that exist
  IF has_subscription_tier AND has_subscription_status THEN
    INSERT INTO public.profiles (
      id, email, full_name, role, subscription_tier, subscription_status
    )
    VALUES (
      NEW.id,
      NEW.email,
      COALESCE(NEW.raw_user_meta_data->>'fullName', NEW.email),
      COALESCE((NEW.raw_user_meta_data->>'role')::user_role, 'student'::user_role),
      'free',
      'active'
    )
    ON CONFLICT (id) DO NOTHING;
  ELSE
    -- Fallback: insert without subscription columns
    INSERT INTO public.profiles (id, email, full_name, role)
    VALUES (
      NEW.id,
      NEW.email,
      COALESCE(NEW.raw_user_meta_data->>'fullName', NEW.email),
      COALESCE((NEW.raw_user_meta_data->>'role')::user_role, 'student'::user_role)
    )
    ON CONFLICT (id) DO NOTHING;
  END IF;
  
  RETURN NEW;
EXCEPTION
  WHEN OTHERS THEN
    -- Log error but don't fail user creation
    RAISE WARNING 'Error creating profile for user %: %', NEW.id, SQLERRM;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Ensure the trigger is properly set up
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Fix any existing auth users without profiles
INSERT INTO public.profiles (id, email, full_name, role)
SELECT 
  u.id,
  u.email,
  COALESCE(u.raw_user_meta_data->>'fullName', u.email, 'User'),
  COALESCE((u.raw_user_meta_data->>'role')::user_role, 'student'::user_role)
FROM auth.users u
WHERE NOT EXISTS (
  SELECT 1 FROM public.profiles p WHERE p.id = u.id
)
ON CONFLICT (id) DO NOTHING;

-- Update subscription fields for all users
UPDATE public.profiles
SET 
  subscription_tier = COALESCE(subscription_tier, 'free'),
  subscription_status = COALESCE(subscription_status, 'active')
WHERE subscription_tier IS NULL OR subscription_status IS NULL;

-- Grant necessary permissions
GRANT USAGE ON SCHEMA public TO anon, authenticated;
GRANT ALL ON public.profiles TO anon, authenticated;
