-- STEP 1: Check current data
SELECT 
    id,
    user_id,
    score,
    submitted_at,
    created_at,
    status
FROM test_submissions
WHERE user_id = '19ab4567-663d-4f76-87ca-15f4a2e8a2a5'
ORDER BY created_at DESC;

-- STEP 2: Fix the submitted_at field (CRITICAL!)
-- This is why the chart shows 0 - backend can't find records without submitted_at
UPDATE test_submissions
SET submitted_at = created_at,
    status = 'submitted'
WHERE submitted_at IS NULL;

-- STEP 3: Verify the fix worked
SELECT 
    COUNT(*) as total_records,
    COUNT(submitted_at) as records_with_submitted_at,
    COUNT(*) - COUNT(submitted_at) as records_still_missing_submitted_at
FROM test_submissions
WHERE user_id = '19ab4567-663d-4f76-87ca-15f4a2e8a2a5';

-- STEP 4: Check the data that will be returned to the chart
SELECT 
    score,
    submitted_at,
    DATE(submitted_at) as submission_date
FROM test_submissions
WHERE user_id = '19ab4567-663d-4f76-87ca-15f4a2e8a2a5'
    AND submitted_at IS NOT NULL
ORDER BY submitted_at ASC;
