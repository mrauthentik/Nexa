-- Allow users to insert their own profile
CREATE POLICY "Users can insert their own profile" ON profiles
    FOR INSERT
    WITH CHECK (auth.uid() = id);

-- Allow users to upsert (INSERT ... ON CONFLICT UPDATE) their own profile
-- This requires both INSERT and UPDATE policies to be true

-- Ensure UPDATE policy exists and is correct
DROP POLICY IF EXISTS "Users can update their own profile" ON profiles;
CREATE POLICY "Users can update their own profile" ON profiles
    FOR UPDATE
    USING (auth.uid() = id);

-- Ensure public access to profiles for specific columns (if needed) or fix 406
-- The 406 Not Acceptable often comes from a mismatch in return types or RLS blocking headers
-- Grant access to the table explicitly
GRANT ALL ON profiles TO authenticated;
GRANT ALL ON profiles TO anon;
