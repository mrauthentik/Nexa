-- ============================================================
-- FIX: CBT Test Submission Notification Type Mismatch
-- Error: column "type" is of type notification_type but expression is of type text
--
-- The notification_type enum only allows:
--   'assignment', 'exam', 'grade', 'announcement', 'system'
--
-- The triggers were using invalid values:
--   'success', 'info', 'warning', 'reminder', 'achievement'
--
-- Fix: Map all trigger inserts to valid enum values.
-- Run this in the Supabase SQL Editor.
-- ============================================================

-- 1. Fix notify_test_submission (used 'success', 'info', 'warning')
CREATE OR REPLACE FUNCTION notify_test_submission()
RETURNS TRIGGER AS $$
DECLARE
  course_name TEXT;
  notification_title TEXT;
  notification_message TEXT;
BEGIN
  -- Get course name
  SELECT title INTO course_name FROM courses WHERE id = NEW.course_id;

  -- Determine notification based on score
  IF NEW.score >= 80 THEN
    notification_title := 'Excellent Performance! 🎉';
    notification_message := 'You scored ' || NEW.score || '% on ' || COALESCE(course_name, 'your test') || '. Keep up the great work!';
  ELSIF NEW.score >= 50 THEN
    notification_title := 'Test Completed ✅';
    notification_message := 'You scored ' || NEW.score || '% on ' || COALESCE(course_name, 'your test') || '. Good job!';
  ELSE
    notification_title := 'Keep Practicing! 💪';
    notification_message := 'You scored ' || NEW.score || '% on ' || COALESCE(course_name, 'your test') || '. Review the material and try again!';
  END IF;

  -- Insert notification using only valid enum values
  -- 'success' -> 'grade', 'info' -> 'grade', 'warning' -> 'grade'
  INSERT INTO notifications (user_id, type, title, message, link, read)
  VALUES (
    NEW.user_id,
    'grade'::notification_type,
    notification_title,
    notification_message,
    '/cbt/results',
    false
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Fix notify_event_created (used 'info')
CREATE OR REPLACE FUNCTION notify_event_created()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO notifications (user_id, type, title, message, link, read)
  VALUES (
    NEW.user_id,
    'announcement'::notification_type,
    'Event Created 📅',
    'New event: "' || NEW.title || '" scheduled for ' || TO_CHAR(NEW.date::date, 'Mon DD, YYYY'),
    '/schedule',
    false
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 3. Fix notify_study_streak (used 'achievement')
CREATE OR REPLACE FUNCTION notify_study_streak()
RETURNS TRIGGER AS $$
DECLARE
  streak_count INTEGER;
BEGIN
  -- Count consecutive days with submissions
  SELECT COUNT(DISTINCT DATE(submitted_at))
  INTO streak_count
  FROM test_submissions
  WHERE user_id = NEW.user_id
  AND submitted_at >= CURRENT_DATE - INTERVAL '7 days';

  -- Notify on milestones
  IF streak_count IN (3, 5, 7, 10, 14, 21, 30) THEN
    INSERT INTO notifications (user_id, type, title, message, link, read)
    VALUES (
      NEW.user_id,
      'system'::notification_type,
      'Study Streak! 🔥',
      'Amazing! You''ve practiced for ' || streak_count || ' days in a row. Keep it up!',
      '/dashboard',
      false
    );
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 4. Fix notify_perfect_score (used 'achievement')
CREATE OR REPLACE FUNCTION notify_perfect_score()
RETURNS TRIGGER AS $$
DECLARE
  course_name TEXT;
BEGIN
  IF NEW.score = 100 THEN
    SELECT title INTO course_name FROM courses WHERE id = NEW.course_id;

    INSERT INTO notifications (user_id, type, title, message, link, read)
    VALUES (
      NEW.user_id,
      'grade'::notification_type,
      'Perfect Score! 🌟',
      'Congratulations! You scored 100% on ' || COALESCE(course_name, 'your test') || '!',
      '/cbt/results',
      false
    );
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. Fix notify_new_user (was already using 'announcement' which is valid, but re-applying for safety)
CREATE OR REPLACE FUNCTION notify_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO notifications (user_id, type, title, message, link, read)
  VALUES (
    NEW.id,
    'announcement'::notification_type,
    'Welcome to NEXA! 🎉',
    'Start your learning journey by exploring CBT practice tests and study materials.',
    '/dashboard',
    false
  );

  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 6. Fix send_event_reminders (used 'reminder')
CREATE OR REPLACE FUNCTION send_event_reminders()
RETURNS void AS $$
DECLARE
  event_record RECORD;
BEGIN
  -- Find events happening tomorrow
  FOR event_record IN
    SELECT ce.*, p.id as profile_user_id
    FROM calendar_events ce
    JOIN profiles p ON p.id = ce.user_id
    WHERE ce.date = CURRENT_DATE + INTERVAL '1 day'
  LOOP
    -- Check if reminder already sent
    IF NOT EXISTS (
      SELECT 1 FROM notifications
      WHERE user_id = event_record.profile_user_id
      AND message LIKE '%' || event_record.title || '%'
      AND created_at::date = CURRENT_DATE
    ) THEN
      INSERT INTO notifications (user_id, type, title, message, link, read)
      VALUES (
        event_record.profile_user_id,
        'announcement'::notification_type,
        'Upcoming Event Reminder 🔔',
        'Reminder: "' || event_record.title || '" is scheduled for tomorrow',
        '/schedule',
        false
      );
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- ============================================================
-- Verify the fix: Check all notification types in the enum
-- ============================================================
SELECT enumlabel
FROM pg_enum
JOIN pg_type ON pg_enum.enumtypid = pg_type.oid
WHERE pg_type.typname = 'notification_type'
ORDER BY enumsortorder;
