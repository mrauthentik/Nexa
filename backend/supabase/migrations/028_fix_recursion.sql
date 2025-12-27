-- Fix recursion by making notification triggers SECURITY DEFINER
-- This ensures they run with system privileges and bypass RLS

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

CREATE OR REPLACE FUNCTION notify_admins_new_message()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert notification for all admin users
    INSERT INTO admin_notifications (admin_id, type, title, message, reference_id, reference_type, priority)
    SELECT 
        id,
        'new_message',
        'New Support Message',
        'New message from ' || NEW.name || ' - Subject: ' || NEW.subject,
        NEW.id,
        'support_message',
        CASE 
            WHEN NEW.priority = 'urgent' THEN 'urgent'
            WHEN NEW.priority = 'high' THEN 'high'
            ELSE 'normal'
        END
    FROM profiles
    WHERE role = 'admin';
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;
