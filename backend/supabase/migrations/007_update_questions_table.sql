-- Update questions table to support both test-based and course-based questions
-- This allows questions to be linked to either a test or a course

-- Add new columns to questions table
ALTER TABLE questions
  ADD COLUMN IF NOT EXISTS course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
  ADD COLUMN IF NOT EXISTS question_text TEXT,
  ADD COLUMN IF NOT EXISTS question_type TEXT CHECK (question_type IN ('multiple_choice', 'fill_in_blank', 'true_false')),
  ADD COLUMN IF NOT EXISTS option_a TEXT,
  ADD COLUMN IF NOT EXISTS option_b TEXT,
  ADD COLUMN IF NOT EXISTS option_c TEXT,
  ADD COLUMN IF NOT EXISTS option_d TEXT;

-- Rename 'question' column to avoid confusion (keep both for backward compatibility)
-- The 'question' column will be used for old test-based questions
-- The 'question_text' column will be used for new course-based questions

-- Modify correct_answer to support both integer (old format) and text (new format)
ALTER TABLE questions
  ALTER COLUMN correct_answer TYPE TEXT USING correct_answer::TEXT;

-- Make test_id nullable since questions can now belong to either a test or a course
ALTER TABLE questions
  ALTER COLUMN test_id DROP NOT NULL;

-- Make question column nullable (old format for test-based questions)
ALTER TABLE questions
  ALTER COLUMN question DROP NOT NULL;

-- Make options nullable since new questions use option_a, option_b, etc.
ALTER TABLE questions
  ALTER COLUMN options DROP NOT NULL;

-- Make order_index nullable for course-based questions
ALTER TABLE questions
  ALTER COLUMN order_index DROP NOT NULL;

-- Add constraint to ensure question belongs to either a test or a course (but not both)
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint WHERE conname = 'questions_belongs_to_test_or_course'
  ) THEN
    ALTER TABLE questions
      ADD CONSTRAINT questions_belongs_to_test_or_course 
      CHECK (
        (test_id IS NOT NULL AND course_id IS NULL) OR 
        (test_id IS NULL AND course_id IS NOT NULL)
      );
  END IF;
END $$;

-- Create index for faster course-based queries
CREATE INDEX IF NOT EXISTS idx_questions_course_id ON questions(course_id);

-- Add comment
COMMENT ON TABLE questions IS 'Stores questions for both CBT tests (test_id) and course practice (course_id)';
COMMENT ON COLUMN questions.test_id IS 'Reference to test for CBT practice questions';
COMMENT ON COLUMN questions.course_id IS 'Reference to course for course-based practice questions';
COMMENT ON COLUMN questions.question_type IS 'Type of question: multiple_choice, fill_in_blank, or true_false';
COMMENT ON COLUMN questions.option_a IS 'Option A for multiple choice questions';
COMMENT ON COLUMN questions.option_b IS 'Option B for multiple choice questions';
COMMENT ON COLUMN questions.option_c IS 'Option C for multiple choice questions (null for true/false)';
COMMENT ON COLUMN questions.option_d IS 'Option D for multiple choice questions (null for true/false)';
COMMENT ON COLUMN questions.correct_answer IS 'For multiple choice: A, B, C, or D. For fill_in_blank: exact text answer';
