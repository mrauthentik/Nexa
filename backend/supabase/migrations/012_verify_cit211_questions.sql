-- Verify CIT211 course and questions setup
-- This script helps debug why questions aren't showing

-- Check if CIT211 course exists
DO $$
DECLARE
  v_course_id UUID;
  v_question_count INTEGER;
BEGIN
  -- Get CIT211 course ID
  SELECT id INTO v_course_id FROM courses WHERE code = 'CIT211';
  
  IF v_course_id IS NULL THEN
    RAISE NOTICE 'ERROR: CIT211 course not found! Please run migration 005_populate_courses.sql first.';
  ELSE
    RAISE NOTICE 'CIT211 course found with ID: %', v_course_id;
    
    -- Count questions for this course
    SELECT COUNT(*) INTO v_question_count FROM questions WHERE course_id = v_course_id;
    RAISE NOTICE 'Number of questions for CIT211: %', v_question_count;
    
    IF v_question_count = 0 THEN
      RAISE NOTICE 'WARNING: No questions found for CIT211. Please run migrations 008-011 to populate questions.';
    ELSE
      RAISE NOTICE 'SUCCESS: CIT211 has % questions in the database.', v_question_count;
    END IF;
  END IF;
END $$;

-- Show sample questions for CIT211
SELECT 
  c.code,
  c.title,
  COUNT(q.id) as question_count
FROM courses c
LEFT JOIN questions q ON q.course_id = c.id
WHERE c.code = 'CIT211'
GROUP BY c.id, c.code, c.title;

-- Show first 5 questions for CIT211 (if any)
SELECT 
  q.id,
  q.question_text,
  q.question_type,
  q.correct_answer,
  q.option_a,
  q.option_b,
  q.option_c,
  q.option_d
FROM questions q
JOIN courses c ON c.id = q.course_id
WHERE c.code = 'CIT211'
LIMIT 5;
