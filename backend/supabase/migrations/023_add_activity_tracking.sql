-- =====================================================
-- ADD ACTIVITY TRACKING FOR ONLINE STATUS
-- Tracks when users were last active and if they're currently online
-- =====================================================

-- Add activity tracking columns to profiles table
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS last_active_at TIMESTAMPTZ DEFAULT NOW(),
ADD COLUMN IF NOT EXISTS is_online BOOLEAN DEFAULT false;

-- Create index for faster queries on last_active_at
CREATE INDEX IF NOT EXISTS idx_profiles_last_active ON profiles(last_active_at);
CREATE INDEX IF NOT EXISTS idx_profiles_is_online ON profiles(is_online);

-- Update existing profiles to have current timestamp
UPDATE profiles 
SET last_active_at = NOW() 
WHERE last_active_at IS NULL;

-- Function to update user activity
CREATE OR REPLACE FUNCTION update_user_activity(user_id UUID)
RETURNS void AS $$
BEGIN
  UPDATE profiles
  SET 
    last_active_at = NOW(),
    is_online = true
  WHERE id = user_id;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to mark users as offline if inactive for more than 5 minutes
CREATE OR REPLACE FUNCTION mark_inactive_users_offline()
RETURNS void AS $$
BEGIN
  UPDATE profiles
  SET is_online = false
  WHERE 
    is_online = true 
    AND last_active_at < NOW() - INTERVAL '5 minutes';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Function to get time since last active (human readable)
CREATE OR REPLACE FUNCTION get_last_active_text(last_active TIMESTAMPTZ)
RETURNS TEXT AS $$
DECLARE
  time_diff INTERVAL;
  seconds INTEGER;
  minutes INTEGER;
  hours INTEGER;
  days INTEGER;
BEGIN
  time_diff := NOW() - last_active;
  seconds := EXTRACT(EPOCH FROM time_diff)::INTEGER;
  
  IF seconds < 60 THEN
    RETURN 'Just now';
  ELSIF seconds < 300 THEN -- Less than 5 minutes
    RETURN 'Online';
  ELSIF seconds < 3600 THEN -- Less than 1 hour
    minutes := seconds / 60;
    RETURN minutes || ' min ago';
  ELSIF seconds < 86400 THEN -- Less than 1 day
    hours := seconds / 3600;
    IF hours = 1 THEN
      RETURN '1 hour ago';
    ELSE
      RETURN hours || ' hours ago';
    END IF;
  ELSIF seconds < 604800 THEN -- Less than 1 week
    days := seconds / 86400;
    IF days = 1 THEN
      RETURN 'Yesterday';
    ELSE
      RETURN days || ' days ago';
    END IF;
  ELSE
    RETURN to_char(last_active, 'Mon DD, YYYY');
  END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

-- Create a view for online users count
CREATE OR REPLACE VIEW online_users_count AS
SELECT 
  COUNT(*) FILTER (WHERE is_online = true) as online_count,
  COUNT(*) FILTER (WHERE last_active_at > NOW() - INTERVAL '24 hours') as active_24h,
  COUNT(*) FILTER (WHERE last_active_at > NOW() - INTERVAL '7 days') as active_7d,
  COUNT(*) as total_users
FROM profiles
WHERE role = 'student';

-- Grant permissions
GRANT SELECT ON online_users_count TO authenticated;

-- Add comment
COMMENT ON COLUMN profiles.last_active_at IS 'Timestamp of user last activity';
COMMENT ON COLUMN profiles.is_online IS 'True if user was active in last 5 minutes';
COMMENT ON FUNCTION update_user_activity IS 'Updates user last active timestamp and online status';
COMMENT ON FUNCTION mark_inactive_users_offline IS 'Marks users as offline if inactive for more than 5 minutes';
COMMENT ON FUNCTION get_last_active_text IS 'Returns human-readable text for last active time';

-- Success message
DO $$
BEGIN
  RAISE NOTICE '✅ Activity tracking added successfully!';
  RAISE NOTICE '   - last_active_at column added';
  RAISE NOTICE '   - is_online column added';
  RAISE NOTICE '   - Indexes created for performance';
  RAISE NOTICE '   - Helper functions created';
  RAISE NOTICE '   - online_users_count view created';
END $$;
