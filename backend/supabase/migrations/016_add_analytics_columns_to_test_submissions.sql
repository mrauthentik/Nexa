-- Add analytics columns to test_submissions for dashboard stats
ALTER TABLE test_submissions
  ADD COLUMN IF NOT EXISTS total_questions INTEGER,
  ADD COLUMN IF NOT EXISTS correct_answers INTEGER,
  ADD COLUMN IF NOT EXISTS course_id UUID REFERENCES courses(id);

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_test_submissions_user_id ON test_submissions(user_id);
CREATE INDEX IF NOT EXISTS idx_test_submissions_course_id ON test_submissions(course_id);
CREATE INDEX IF NOT EXISTS idx_test_submissions_submitted_at ON test_submissions(submitted_at);

-- Update existing rows to populate course_id from tests table where possible
UPDATE test_submissions ts
SET course_id = t.course_id
FROM tests t
WHERE ts.test_id = t.id
  AND ts.course_id IS NULL;
