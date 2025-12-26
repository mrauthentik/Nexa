-- Fix 1: Recreate admin notification trigger (was dropped earlier)
-- This notifies admins when a new user signs up

CREATE OR REPLACE FUNCTION notify_admins_new_user()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert notification for all admin users
    INSERT INTO admin_notifications (admin_id, type, title, message, reference_id, reference_type, priority)
    SELECT 
        id,
        'new_user',
        'New User Registered',
        'A new user ' || NEW.full_name || ' (' || NEW.email || ') has registered on the platform.',
        NEW.id,
        'user',
        'normal'
    FROM profiles
    WHERE role = 'admin';
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Create trigger
DROP TRIGGER IF EXISTS trigger_notify_admins_new_user ON profiles;
CREATE TRIGGER trigger_notify_admins_new_user
    AFTER INSERT ON profiles
    FOR EACH ROW
    EXECUTE FUNCTION notify_admins_new_user();

-- Fix 2: Ensure announcements table has proper RLS for landing page viewing
-- Drop existing policies
DROP POLICY IF EXISTS "Everyone can view active announcements" ON announcements;
DROP POLICY IF EXISTS "Public can view landing announcements" ON announcements;

-- Create policy for public viewing of landing page announcements
CREATE POLICY "Public can view landing announcements" ON announcements
FOR SELECT
USING (
    active = true 
    AND (target = 'landing' OR target = 'both')
    AND (start_date IS NULL OR start_date <= NOW())
    AND (end_date IS NULL OR end_date >= NOW())
);

-- Create policy for authenticated users to view user announcements
CREATE POLICY "Users can view user announcements" ON announcements
FOR SELECT
USING (
    active = true 
    AND (target = 'users' OR target = 'both')
    AND (start_date IS NULL OR start_date <= NOW())
    AND (end_date IS NULL OR end_date >= NOW())
);
