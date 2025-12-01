-- =====================================================
-- VERIFY STUDENT MANAGEMENT SETUP
-- Run this to check if everything is configured correctly
-- =====================================================

-- 1. CHECK IF PROFILES TABLE EXISTS AND HAS CORRECT STRUCTURE
DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'profiles') THEN
        RAISE NOTICE '✅ profiles table exists';
    ELSE
        RAISE EXCEPTION '❌ profiles table does not exist!';
    END IF;
END $$;

-- 2. CHECK IF ROLE COLUMN EXISTS
DO $$
BEGIN
    IF EXISTS (
        SELECT FROM information_schema.columns 
        WHERE table_schema = 'public' 
        AND table_name = 'profiles' 
        AND column_name = 'role'
    ) THEN
        RAISE NOTICE '✅ role column exists in profiles table';
    ELSE
        RAISE EXCEPTION '❌ role column missing from profiles table!';
    END IF;
END $$;

-- 3. CHECK IF AUTO-CREATE PROFILE TRIGGER EXISTS
DO $$
BEGIN
    IF EXISTS (
        SELECT FROM pg_trigger 
        WHERE tgname = 'on_auth_user_created'
    ) THEN
        RAISE NOTICE '✅ Auto-create profile trigger exists';
    ELSE
        RAISE WARNING '⚠️ Auto-create profile trigger missing! New users will not get profiles automatically.';
    END IF;
END $$;

-- 4. CHECK IF ADMIN NOTIFICATION TRIGGER EXISTS
DO $$
BEGIN
    IF EXISTS (
        SELECT FROM pg_trigger 
        WHERE tgname = 'trigger_notify_admins_new_user'
    ) THEN
        RAISE NOTICE '✅ Admin notification trigger exists';
    ELSE
        RAISE WARNING '⚠️ Admin notification trigger missing! Admins will not be notified of new users.';
    END IF;
END $$;

-- 5. CHECK IF ADMIN_NOTIFICATIONS TABLE EXISTS
DO $$
BEGIN
    IF EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'admin_notifications') THEN
        RAISE NOTICE '✅ admin_notifications table exists';
    ELSE
        RAISE WARNING '⚠️ admin_notifications table missing!';
    END IF;
END $$;

-- 6. DISPLAY CURRENT PROFILES SUMMARY
DO $$
DECLARE
    total_profiles INT;
    total_students INT;
    total_admins INT;
BEGIN
    SELECT COUNT(*) INTO total_profiles FROM profiles;
    SELECT COUNT(*) INTO total_students FROM profiles WHERE role = 'student';
    SELECT COUNT(*) INTO total_admins FROM profiles WHERE role = 'admin';
    
    RAISE NOTICE '📊 PROFILES SUMMARY:';
    RAISE NOTICE '   Total profiles: %', total_profiles;
    RAISE NOTICE '   Students: %', total_students;
    RAISE NOTICE '   Admins: %', total_admins;
    
    IF total_students = 0 THEN
        RAISE WARNING '⚠️ No students found! Register a new user to create a student.';
    END IF;
    
    IF total_admins = 0 THEN
        RAISE WARNING '⚠️ No admins found! You need at least one admin user.';
    END IF;
END $$;

-- 7. SHOW SAMPLE PROFILES (LIMIT 5)
SELECT 
    id,
    email,
    full_name,
    role,
    department,
    level,
    created_at
FROM profiles
ORDER BY created_at DESC
LIMIT 5;

-- 8. CHECK AUTH.USERS vs PROFILES SYNC
SELECT 
    'Missing Profile' as issue,
    u.id,
    u.email,
    u.created_at
FROM auth.users u
LEFT JOIN profiles p ON p.id = u.id
WHERE p.id IS NULL
UNION ALL
SELECT 
    'Missing Auth User' as issue,
    p.id,
    p.email,
    p.created_at
FROM profiles p
LEFT JOIN auth.users u ON u.id = p.id
WHERE u.id IS NULL;

-- 9. FIX: CREATE PROFILES FOR AUTH USERS WITHOUT PROFILES
INSERT INTO profiles (id, email, full_name, role, subscription_tier, subscription_status)
SELECT 
    u.id,
    u.email,
    COALESCE(u.raw_user_meta_data->>'fullName', u.email, 'User'),
    COALESCE((u.raw_user_meta_data->>'role')::user_role, 'student'::user_role),
    'free',
    'active'
FROM auth.users u
WHERE NOT EXISTS (
    SELECT 1 FROM profiles p WHERE p.id = u.id
)
ON CONFLICT (id) DO NOTHING;

-- 10. VERIFY RLS POLICIES
SELECT 
    schemaname,
    tablename,
    policyname,
    permissive,
    roles,
    cmd,
    qual
FROM pg_policies
WHERE tablename IN ('profiles', 'admin_notifications')
ORDER BY tablename, policyname;

-- 11. TEST QUERY (What the API does)
SELECT 
    p.*,
    COUNT(ts.id) as total_tests,
    COALESCE(AVG(ts.score), 0) as average_score
FROM profiles p
LEFT JOIN test_submissions ts ON ts.user_id = p.id
WHERE p.role = 'student'
GROUP BY p.id
ORDER BY p.created_at DESC;

-- 12. CHECK RECENT ADMIN NOTIFICATIONS
SELECT 
    an.id,
    an.type,
    an.title,
    an.message,
    an.read,
    an.created_at,
    p.email as admin_email
FROM admin_notifications an
JOIN profiles p ON p.id = an.admin_id
ORDER BY an.created_at DESC
LIMIT 10;

-- =====================================================
-- MANUAL FIX COMMANDS (if needed)
-- =====================================================

-- If you need to manually set a user as admin:
-- UPDATE profiles SET role = 'admin' WHERE email = 'your-email@example.com';

-- If you need to create a test student:
-- INSERT INTO profiles (id, email, full_name, role, department, level, student_id)
-- VALUES (
--     gen_random_uuid(),
--     'teststudent@example.com',
--     'Test Student',
--     'student',
--     'Computer Science',
--     '200',
--     'CS/2024/001'
-- );

-- If triggers are missing, re-run:
-- \i 004_auto_create_profile_trigger.sql
-- \i 022_admin_features.sql
