-- Fix RLS policy for questions table to support both test-based and course-based questions
-- The old policy only allowed viewing questions linked to active tests
-- We need to also allow viewing questions linked to courses

-- Drop the old restrictive policy
DROP POLICY IF EXISTS "Users can view questions of active tests" ON questions;

-- Create new policy that allows viewing questions from both tests and courses
CREATE POLICY "Users can view questions" ON questions FOR SELECT USING (
    -- Allow if question belongs to an active test
    (test_id IS NOT NULL AND EXISTS (
        SELECT 1 FROM tests WHERE tests.id = questions.test_id AND tests.status = 'active'
    ))
    OR
    -- Allow if question belongs to an active course
    (course_id IS NOT NULL AND EXISTS (
        SELECT 1 FROM courses WHERE courses.id = questions.course_id AND courses.is_active = true
    ))
);

-- Keep the admin policy as is
-- CREATE POLICY "Admins can manage questions" ON questions FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Add comment
COMMENT ON POLICY "Users can view questions" ON questions IS 'Allows users to view questions from active tests or active courses';
