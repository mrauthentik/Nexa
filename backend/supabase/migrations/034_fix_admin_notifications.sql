-- Fix 1: Ensure admin_notifications table has proper RLS
-- Allow system (triggers) to insert notifications
DROP POLICY IF EXISTS "System can create admin notifications" ON admin_notifications;
CREATE POLICY "System can create admin notifications" ON admin_notifications
FOR INSERT WITH CHECK (true);

-- Allow admins to view their notifications
DROP POLICY IF EXISTS "Admins can view their own notifications" ON admin_notifications;
CREATE POLICY "Admins can view their own notifications" ON admin_notifications
FOR SELECT USING (admin_id = auth.uid());

-- Allow admins to update their notifications (mark as read)
DROP POLICY IF EXISTS "Admins can update their own notifications" ON admin_notifications;
CREATE POLICY "Admins can update their own notifications" ON admin_notifications
FOR UPDATE USING (admin_id = auth.uid());

-- Allow admins to delete their notifications
DROP POLICY IF EXISTS "Admins can delete their own notifications" ON admin_notifications;
CREATE POLICY "Admins can delete their own notifications" ON admin_notifications
FOR DELETE USING (admin_id = auth.uid());

-- Fix 2: Test the trigger by manually creating a test notification
-- (Run this to verify the trigger works)
-- You can delete this test notification after verifying
DO $$
DECLARE
    test_admin_id UUID;
BEGIN
    -- Get the first admin user
    SELECT id INTO test_admin_id FROM profiles WHERE role = 'admin' LIMIT 1;
    
    IF test_admin_id IS NOT NULL THEN
        -- Insert a test notification
        INSERT INTO admin_notifications (admin_id, type, title, message, priority)
        VALUES (
            test_admin_id,
            'system',
            'Test Notification',
            'This is a test notification to verify the system is working.',
            'normal'
        );
        
        RAISE NOTICE 'Test notification created for admin: %', test_admin_id;
    ELSE
        RAISE NOTICE 'No admin users found';
    END IF;
END $$;
