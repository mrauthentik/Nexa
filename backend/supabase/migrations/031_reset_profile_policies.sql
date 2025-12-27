-- ========================================================
-- RESET ALL PROFILE POLICIES
-- Run this to fix 403 Forbidden / 406 Not Acceptable errors
-- ========================================================

-- 1. Enable RLS (Ensure it's on)
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

-- 2. Drop ALL existing policies to avoid conflicts
-- We use a DO block to loop through and drop them to be thorough
DO $$ 
DECLARE 
    pol record; 
BEGIN 
    FOR pol IN SELECT policyname FROM pg_policies WHERE tablename = 'profiles' 
    LOOP 
        EXECUTE format('DROP POLICY IF EXISTS %I ON profiles', pol.policyname); 
    END LOOP; 
END $$;

-- 3. Recreate Policies Forcefully

-- view (SELECT)
CREATE POLICY "Users can view their own profile" ON profiles 
FOR SELECT USING (auth.uid() = id);

-- insert (INSERT) - CRITICAL for new signups
CREATE POLICY "Users can insert their own profile" ON profiles 
FOR INSERT WITH CHECK (auth.uid() = id);

-- update (UPDATE) - CRITICAL for upserts/edits
CREATE POLICY "Users can update their own profile" ON profiles 
FOR UPDATE USING (auth.uid() = id);

-- admin view (using the secure function we added earlier)
-- If is_admin() doesn't exist, we fallback to a simple check
CREATE POLICY "Admins can view all profiles" ON profiles 
FOR SELECT USING (
  (SELECT role FROM profiles WHERE id = auth.uid()) = 'admin'
);
