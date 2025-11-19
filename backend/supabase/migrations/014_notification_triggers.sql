-- Create notification triggers for automatic notifications
-- This migration creates triggers that automatically send notifications when certain events occur

-- 1. Trigger for test submission notifications
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
    notification_message := 'You scored ' || NEW.score || '% on ' || course_name || '. Keep up the great work!';
  ELSIF NEW.score >= 50 THEN
    notification_title := 'Test Completed ✅';
    notification_message := 'You scored ' || NEW.score || '% on ' || course_name || '. Good job!';
  ELSE
    notification_title := 'Keep Practicing! 💪';
    notification_message := 'You scored ' || NEW.score || '% on ' || course_name || '. Review the material and try again!';
  END IF;
  
  -- Insert notification
  INSERT INTO notifications (user_id, type, title, message, link, read)
  VALUES (
    NEW.user_id,
    CASE 
      WHEN NEW.score >= 80 THEN 'success'
      WHEN NEW.score >= 50 THEN 'info'
      ELSE 'warning'
    END,
    notification_title,
    notification_message,
    '/cbt/results',
    false
  );
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Drop trigger if exists and create new one
DROP TRIGGER IF EXISTS test_submission_notification ON test_submissions;
CREATE TRIGGER test_submission_notification
AFTER INSERT ON test_submissions
FOR EACH ROW
EXECUTE FUNCTION notify_test_submission();

-- 2. Trigger for calendar event creation notifications
CREATE OR REPLACE FUNCTION notify_event_created()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO notifications (user_id, type, title, message, link, read)
  VALUES (
    NEW.user_id,
    'info',
    'Event Created 📅',
    'New event: "' || NEW.title || '" scheduled for ' || TO_CHAR(NEW.date::date, 'Mon DD, YYYY'),
    '/schedule',
    false
  );
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS event_creation_notification ON calendar_events;
CREATE TRIGGER event_creation_notification
AFTER INSERT ON calendar_events
FOR EACH ROW
EXECUTE FUNCTION notify_event_created();

-- 3. Trigger for upcoming event reminders (run daily via cron)
CREATE OR REPLACE FUNCTION send_event_reminders()
RETURNS void AS $$
DECLARE
  event_record RECORD;
BEGIN
  -- Find events happening tomorrow
  FOR event_record IN 
    SELECT ce.*, p.id as user_id
    FROM calendar_events ce
    JOIN profiles p ON p.id = ce.user_id
    WHERE ce.date = CURRENT_DATE + INTERVAL '1 day'
  LOOP
    -- Check if reminder already sent
    IF NOT EXISTS (
      SELECT 1 FROM notifications 
      WHERE user_id = event_record.user_id 
      AND message LIKE '%' || event_record.title || '%'
      AND created_at::date = CURRENT_DATE
    ) THEN
      INSERT INTO notifications (user_id, type, title, message, link, read)
      VALUES (
        event_record.user_id,
        'reminder',
        'Upcoming Event Reminder 🔔',
        'Reminder: "' || event_record.title || '" is scheduled for tomorrow',
        '/schedule',
        false
      );
    END IF;
  END LOOP;
END;
$$ LANGUAGE plpgsql;

-- 4. Trigger for study streak notifications
CREATE OR REPLACE FUNCTION notify_study_streak()
RETURNS TRIGGER AS $$
DECLARE
  streak_count INTEGER;
  last_submission_date DATE;
BEGIN
  -- Count consecutive days with submissions
  SELECT COUNT(DISTINCT DATE(created_at))
  INTO streak_count
  FROM test_submissions
  WHERE user_id = NEW.user_id
  AND created_at >= CURRENT_DATE - INTERVAL '7 days';
  
  -- Notify on milestones
  IF streak_count IN (3, 5, 7, 10, 14, 21, 30) THEN
    INSERT INTO notifications (user_id, type, title, message, link, read)
    VALUES (
      NEW.user_id,
      'achievement',
      'Study Streak! 🔥',
      'Amazing! You''ve practiced for ' || streak_count || ' days in a row. Keep it up!',
      '/dashboard',
      false
    );
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS study_streak_notification ON test_submissions;
CREATE TRIGGER study_streak_notification
AFTER INSERT ON test_submissions
FOR EACH ROW
EXECUTE FUNCTION notify_study_streak();

-- 5. Trigger for perfect score notifications
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
      'achievement',
      'Perfect Score! 🌟',
      'Congratulations! You scored 100% on ' || course_name || '!',
      '/cbt/results',
      false
    );
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS perfect_score_notification ON test_submissions;
CREATE TRIGGER perfect_score_notification
AFTER INSERT ON test_submissions
FOR EACH ROW
EXECUTE FUNCTION notify_perfect_score();

-- 6. Welcome notification for new users (already handled in AuthContext, but adding fallback)
CREATE OR REPLACE FUNCTION notify_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO notifications (user_id, type, title, message, link, read)
  VALUES (
    NEW.id,
    'announcement',
    'Welcome to NEXA! 🎉',
    'Start your learning journey by exploring CBT practice tests and study materials.',
    '/dashboard',
    false
  );
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS new_user_notification ON profiles;
CREATE TRIGGER new_user_notification
AFTER INSERT ON profiles
FOR EACH ROW
EXECUTE FUNCTION notify_new_user();

-- Add comments
COMMENT ON FUNCTION notify_test_submission() IS 'Sends notification when user submits a test';
COMMENT ON FUNCTION notify_event_created() IS 'Sends notification when user creates a calendar event';
COMMENT ON FUNCTION send_event_reminders() IS 'Sends reminders for events happening tomorrow (run via cron)';
COMMENT ON FUNCTION notify_study_streak() IS 'Sends notification for study streak milestones';
COMMENT ON FUNCTION notify_perfect_score() IS 'Sends notification for perfect test scores';
COMMENT ON FUNCTION notify_new_user() IS 'Sends welcome notification to new users';
