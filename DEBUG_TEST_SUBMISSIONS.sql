-- Check ALL test submissions in the database
SELECT 
    id,
    user_id,
    course_id,
    score,
    submitted_at,
    status,
    created_at
FROM test_submissions
ORDER BY created_at DESC
LIMIT 20;

-- Count total submissions
SELECT COUNT(*) as total_submissions FROM test_submissions;

-- Check submissions by user
SELECT 
    user_id,
    COUNT(*) as test_count,
    MAX(created_at) as last_test
FROM test_submissions
GROUP BY user_id;

-- Check if your specific user exists in profiles
SELECT id, email, full_name 
FROM profiles 
WHERE id = '19ab4567-663d-4f76-87ca-15f4a2e8a2a5';

-- Check all users
SELECT id, email, full_name, created_at
FROM profiles
ORDER BY created_at DESC
LIMIT 10;
