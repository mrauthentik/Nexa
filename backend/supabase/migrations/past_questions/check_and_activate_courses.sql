-- Check which courses we just added questions for
-- and verify they're active

-- First, see what questions we have
SELECT c.code, c.title, COUNT(q.id) as question_count, c.is_active
FROM courses c
LEFT JOIN questions q ON c.id = q.course_id
WHERE c.code IN ('GST103', 'AGR205', 'CIT191', 'BIO102', 'MAC111', 'CHM203', 'ESM221')
GROUP BY c.id, c.code, c.title, c.is_active
ORDER BY question_count DESC;

-- Then activate all courses that have questions but aren't active
UPDATE courses 
SET is_active = true 
WHERE id IN (SELECT DISTINCT course_id FROM questions WHERE course_id IS NOT NULL)
AND is_active = false;
