-- =====================================================
-- COMPREHENSIVE STUDENT MANAGEMENT DIAGNOSTICS
-- Run this to find out exactly what's wrong
-- =====================================================

-- 1. CHECK ENUM TYPE EXISTS
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role') THEN
        RAISE NOTICE '✅ user_role enum type exists';
        
        -- Show enum values
        SELECT enumlabel FROM pg_enum 
        WHERE enumtypid = 'user_role'::regtype;
    ELSE
        RAISE EXCEPTION '❌ user_role enum type does NOT exist!';
    END IF;
END $$;

-- 2. CHECK PROFILES TABLE STRUCTURE
SELECT 
    column_name,
    data_type,
    udt_name,
    column_default,
    is_nullable
FROM information_schema.columns
WHERE table_name = 'profiles'
ORDER BY ordinal_position;

-- 3. COUNT ALL USERS
DO $$
DECLARE
    auth_count INT;
    profile_count INT;
    student_count INT;
    admin_count INT;
BEGIN
    SELECT COUNT(*) INTO auth_count FROM auth.users;
    SELECT COUNT(*) INTO profile_count FROM profiles;
    SELECT COUNT(*) INTO student_count FROM profiles WHERE role = 'student';
    SELECT COUNT(*) INTO admin_count FROM profiles WHERE role = 'admin';
    
    RAISE NOTICE '📊 DATABASE COUNTS:';
    RAISE NOTICE '   auth.users: %', auth_count;
    RAISE NOTICE '   profiles: %', profile_count;
    RAISE NOTICE '   students (role=student): %', student_count;
    RAISE NOTICE '   admins (role=admin): %', admin_count;
    RAISE NOTICE '   Missing profiles: %', auth_count - profile_count;
END $$;

-- 4. SHOW ALL PROFILES WITH DETAILS
SELECT 
    id,
    email,
    full_name,
    role,
    role::text as role_text,
    subscription_tier,
    subscription_status,
    created_at
FROM profiles
ORDER BY created_at DESC;

-- 5. CHECK FOR ORPHANED AUTH USERS
SELECT 
    'Orphaned auth.users (no profile)' as issue,
    u.id,
    u.email,
    u.created_at
FROM auth.users u
LEFT JOIN profiles p ON p.id = u.id
WHERE p.id IS NULL;

-- 6. CHECK FOR ORPHANED PROFILES
SELECT 
    'Orphaned profiles (no auth.users)' as issue,
    p.id,
    p.email,
    p.created_at
FROM profiles p
LEFT JOIN auth.users u ON u.id = p.id
WHERE u.id IS NULL;

-- 7. TEST THE EXACT QUERY THE API USES
SELECT 
    'API Query Test' as test_name,
    COUNT(*) as student_count
FROM profiles
WHERE role = 'student';

-- 8. SHOW STUDENTS WITH FULL DETAILS
SELECT 
    p.id,
    p.email,
    p.full_name,
    p.role,
    p.department,
    p.level,
    p.student_id,
    p.subscription_tier,
    p.subscription_status,
    p.created_at,
    COUNT(ts.id) as total_tests,
    COALESCE(AVG(ts.score), 0) as average_score
FROM profiles p
LEFT JOIN test_submissions ts ON ts.user_id = p.id
WHERE p.role = 'student'
GROUP BY p.id
ORDER BY p.created_at DESC;

-- 9. CHECK TRIGGERS
SELECT 
    trigger_name,
    event_manipulation,
    event_object_table,
    action_statement
FROM information_schema.triggers
WHERE trigger_name IN ('on_auth_user_created', 'trigger_notify_admins_new_user')
ORDER BY trigger_name;

-- 10. CHECK RLS POLICIES ON PROFILES
SELECT 
    policyname,
    permissive,
    roles,
    cmd,
    qual,
    with_check
FROM pg_policies
WHERE tablename = 'profiles';

-- 11. TEST ROLE CASTING
DO $$
BEGIN
    -- Test if we can cast 'student' to user_role
    PERFORM 'student'::user_role;
    RAISE NOTICE '✅ Can cast ''student'' to user_role';
    
    PERFORM 'admin'::user_role;
    RAISE NOTICE '✅ Can cast ''admin'' to user_role';
EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION '❌ Cannot cast to user_role: %', SQLERRM;
END $$;

-- 12. SHOW SUBSCRIPTION STATUS CONSTRAINT
SELECT 
    conname as constraint_name,
    contype as constraint_type,
    pg_get_constraintdef(oid) as constraint_definition
FROM pg_constraint
WHERE conrelid = 'profiles'::regclass
AND conname LIKE '%subscription%';

-- 13. CHECK IF ANY STUDENTS EXIST (ALTERNATIVE QUERY)
SELECT EXISTS (
    SELECT 1 FROM profiles WHERE role = 'student'
) as students_exist;

-- 14. RAW DATA DUMP - FIRST 5 PROFILES
SELECT 
    'RAW PROFILE DATA' as info,
    *
FROM profiles
LIMIT 5;

-- 15. CHECK auth.users RAW DATA
SELECT 
    'RAW AUTH.USERS DATA' as info,
    id,
    email,
    created_at,
    raw_user_meta_data
FROM auth.users
LIMIT 5;

-- =====================================================
-- SUMMARY AND RECOMMENDATIONS
-- =====================================================
DO $$
DECLARE
    student_count INT;
    profile_count INT;
    auth_count INT;
BEGIN
    SELECT COUNT(*) INTO student_count FROM profiles WHERE role = 'student';
    SELECT COUNT(*) INTO profile_count FROM profiles;
    SELECT COUNT(*) INTO auth_count FROM auth.users;
    
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
    RAISE NOTICE 'DIAGNOSTIC SUMMARY';
    RAISE NOTICE '========================================';
    
    IF student_count = 0 THEN
        RAISE WARNING '⚠️ NO STUDENTS FOUND!';
        RAISE NOTICE '';
        RAISE NOTICE 'Possible causes:';
        RAISE NOTICE '1. No users have registered yet';
        RAISE NOTICE '2. Users exist but role is not set to ''student''';
        RAISE NOTICE '3. Trigger is not creating profiles';
        RAISE NOTICE '';
        
        IF profile_count = 0 THEN
            RAISE WARNING '⚠️ NO PROFILES AT ALL!';
            RAISE NOTICE 'Action: Run the fix script to create profiles for existing users';
        ELSIF profile_count > 0 THEN
            RAISE NOTICE '✅ Profiles exist (%), but none are students', profile_count;
            RAISE NOTICE 'Action: Check the role values in profiles table';
        END IF;
    ELSE
        RAISE NOTICE '✅ Found % student(s)', student_count;
        RAISE NOTICE 'The database has students. If frontend shows empty:';
        RAISE NOTICE '1. Check edge function is deployed';
        RAISE NOTICE '2. Check user is admin';
        RAISE NOTICE '3. Check browser console for errors';
    END IF;
    
    RAISE NOTICE '';
    RAISE NOTICE '========================================';
END $$;
