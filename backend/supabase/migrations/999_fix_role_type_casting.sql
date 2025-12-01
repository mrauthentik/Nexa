-- =====================================================
-- FIX ROLE TYPE CASTING ERROR
-- This fixes the "column role is of type user_role but expression is of type text" error
-- =====================================================

-- 1. Update the handle_new_user trigger function with correct type casting
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, email, full_name, role, subscription_tier, subscription_status)
  VALUES (
    NEW.id,
    NEW.email,
    COALESCE(NEW.raw_user_meta_data->>'fullName', NEW.email),
    COALESCE((NEW.raw_user_meta_data->>'role')::user_role, 'student'::user_role),
    'free',
    'active'
  )
  ON CONFLICT (id) DO NOTHING;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Create profiles for any existing auth users that don't have profiles
INSERT INTO public.profiles (id, email, full_name, role, subscription_tier, subscription_status)
SELECT 
  u.id,
  u.email,
  COALESCE(u.raw_user_meta_data->>'fullName', u.email, 'User'),
  COALESCE((u.raw_user_meta_data->>'role')::user_role, 'student'::user_role),
  'free',
  'active'
FROM auth.users u
WHERE NOT EXISTS (
  SELECT 1 FROM public.profiles p WHERE p.id = u.id
)
ON CONFLICT (id) DO NOTHING;

-- 3. Verify the fix worked
DO $$
DECLARE
  missing_profiles INT;
  total_users INT;
  total_profiles INT;
BEGIN
  SELECT COUNT(*) INTO total_users FROM auth.users;
  SELECT COUNT(*) INTO total_profiles FROM profiles;
  SELECT COUNT(*) INTO missing_profiles 
  FROM auth.users u 
  WHERE NOT EXISTS (SELECT 1 FROM profiles p WHERE p.id = u.id);
  
  RAISE NOTICE '✅ Fix applied successfully!';
  RAISE NOTICE '   Total auth.users: %', total_users;
  RAISE NOTICE '   Total profiles: %', total_profiles;
  RAISE NOTICE '   Missing profiles: %', missing_profiles;
  
  IF missing_profiles = 0 THEN
    RAISE NOTICE '✅ All users have profiles!';
  ELSE
    RAISE WARNING '⚠️ Still % users without profiles', missing_profiles;
  END IF;
END $$;

-- 4. Show all profiles
SELECT 
  id,
  email,
  full_name,
  role,
  created_at
FROM profiles
ORDER BY created_at DESC;
