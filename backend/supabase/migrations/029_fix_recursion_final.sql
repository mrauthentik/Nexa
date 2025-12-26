-- 1. Create a secure function to check if the current user is an admin
-- This function runs with security definer to bypass RLS, avoiding recursion
CREATE OR REPLACE FUNCTION public.is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM public.profiles
    WHERE id = auth.uid()
    AND role = 'admin'
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 2. Drop the recursive policy if it exists (and any similar ones)
DROP POLICY IF EXISTS "Admins can view all profiles" ON profiles;

-- 3. Create a safe Admin policy using the new function
CREATE POLICY "Admins can view all profiles" ON profiles
FOR SELECT
USING (public.is_admin());

-- 4. Ensure notification triggers are safe (reinforcing the fix)
CREATE OR REPLACE FUNCTION notify_admins_new_user()
RETURNS TRIGGER AS $$
BEGIN
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
    WHERE role = 'admin'; -- This now uses the system privileges, bypassing RLS
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- 5. Update other admin policies to use the safe function
-- Support Messages
DROP POLICY IF EXISTS "Admins can view all support messages" ON support_messages;
CREATE POLICY "Admins can view all support messages"
    ON support_messages FOR SELECT
    USING (public.is_admin());

DROP POLICY IF EXISTS "Admins can update support messages" ON support_messages;
CREATE POLICY "Admins can update support messages"
    ON support_messages FOR UPDATE
    USING (public.is_admin());

-- Announcements
DROP POLICY IF EXISTS "Admins can manage announcements" ON announcements;
CREATE POLICY "Admins can manage announcements"
    ON announcements FOR ALL
    USING (public.is_admin());

-- Admin Notifications
DROP POLICY IF EXISTS "Admins can view their own notifications" ON admin_notifications;
CREATE POLICY "Admins can view their own notifications"
    ON admin_notifications FOR SELECT
    USING (admin_id = auth.uid() AND public.is_admin()); -- Redundant but safe

-- User Activity Log
DROP POLICY IF EXISTS "Admins can view all activity logs" ON user_activity_log;
CREATE POLICY "Admins can view all activity logs"
    ON user_activity_log FOR SELECT
    USING (public.is_admin());
