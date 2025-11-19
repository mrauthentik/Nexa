-- Debug Script: Find out why questions aren't showing

-- Step 1: Check if questions exist for this course
SELECT 
  'Questions exist?' as check_type,
  COUNT(*) as count
FROM questions
WHERE course_id = '269c5e9c-738d-4ab4-b9be-5be9c2f34331';

-- Step 2: Check RLS policy status
SELECT 
  'RLS Status' as check_type,
  relrowsecurity as rls_enabled
FROM pg_class 
WHERE relname = 'questions';

-- Step 3: List all policies on questions table
SELECT 
  'Policy: ' || policyname as policy_name,
  cmd as command,
  qual as using_expression
FROM pg_policies 
WHERE tablename = 'questions';

-- Step 4: Check if course_id exists in questions (any course)
SELECT 
  'Total questions' as check_type,
  COUNT(*) as total_questions,
  COUNT(DISTINCT course_id) as courses_with_questions,
  COUNT(DISTINCT test_id) as tests_with_questions
FROM questions;

-- Step 5: Show questions with course_id (if any)
SELECT 
  'Questions with course_id' as check_type,
  c.code as course_code,
  COUNT(q.id) as question_count
FROM questions q
JOIN courses c ON c.id = q.course_id
WHERE q.course_id IS NOT NULL
GROUP BY c.code
ORDER BY question_count DESC
LIMIT 10;

-- Step 6: Check if CIT211 questions have the correct course_id
SELECT 
  'CIT211 Course ID Check' as check_type,
  c.id as course_id,
  c.code,
  c.title,
  (SELECT COUNT(*) FROM questions WHERE course_id = c.id) as question_count
FROM courses c
WHERE c.code = 'CIT211';

-- Step 7: Show sample questions (bypass RLS by using service role)
-- Run this as service_role or in SQL Editor
SELECT 
  id,
  course_id,
  test_id,
  LEFT(question_text, 50) as question_preview,
  question_type
FROM questions
WHERE course_id = '269c5e9c-738d-4ab4-b9be-5be9c2f34331'
LIMIT 5;

-- Step 8: Check if questions were inserted with NULL course_id
SELECT 
  'Questions without course_id' as check_type,
  COUNT(*) as count
FROM questions
WHERE course_id IS NULL AND test_id IS NULL;

-- Step 9: Verify the RLS policy allows course-based questions
SELECT 
  policyname,
  permissive,
  roles,
  cmd,
  qual
FROM pg_policies
WHERE tablename = 'questions'
  AND policyname LIKE '%course%';
