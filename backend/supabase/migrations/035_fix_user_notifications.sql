-- Fix user notifications RLS policies
-- Ensure users can delete their own notifications

-- Drop existing policies
DROP POLICY IF EXISTS "Users can view their own notifications" ON notifications;
DROP POLICY IF EXISTS "Users can update their own notifications" ON notifications;
DROP POLICY IF EXISTS "Users can delete their own notifications" ON notifications;
DROP POLICY IF EXISTS "Admins can create notifications" ON notifications;
DROP POLICY IF EXISTS "System can create notifications" ON notifications;

-- Recreate policies with proper permissions

-- Allow users to view their own notifications
CREATE POLICY "Users can view their own notifications" ON notifications
FOR SELECT USING (auth.uid() = user_id);

-- Allow users to update their own notifications (mark as read)
CREATE POLICY "Users can update their own notifications" ON notifications
FOR UPDATE USING (auth.uid() = user_id);

-- Allow users to delete their own notifications
CREATE POLICY "Users can delete their own notifications" ON notifications
FOR DELETE USING (auth.uid() = user_id);

-- Allow system/triggers to create notifications for users
CREATE POLICY "System can create notifications" ON notifications
FOR INSERT WITH CHECK (true);
