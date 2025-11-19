-- Add new columns to calendar_events table for enhanced features
-- Run this in Supabase SQL Editor

ALTER TABLE calendar_events 
ADD COLUMN IF NOT EXISTS priority TEXT CHECK (priority IN ('low', 'medium', 'high')) DEFAULT 'medium',
ADD COLUMN IF NOT EXISTS reminder_minutes INTEGER DEFAULT 30,
ADD COLUMN IF NOT EXISTS is_recurring BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS recurrence_pattern TEXT CHECK (recurrence_pattern IN ('daily', 'weekly', 'monthly')),
ADD COLUMN IF NOT EXISTS completed BOOLEAN DEFAULT false,
ADD COLUMN IF NOT EXISTS reminder_sent BOOLEAN DEFAULT false;

-- Update existing records to have default values
UPDATE calendar_events 
SET priority = 'medium' 
WHERE priority IS NULL;

UPDATE calendar_events 
SET reminder_minutes = 30 
WHERE reminder_minutes IS NULL;

UPDATE calendar_events 
SET is_recurring = false 
WHERE is_recurring IS NULL;

UPDATE calendar_events 
SET completed = false 
WHERE completed IS NULL;

UPDATE calendar_events 
SET reminder_sent = false 
WHERE reminder_sent IS NULL;

-- Create index for faster queries
CREATE INDEX IF NOT EXISTS idx_calendar_events_date ON calendar_events(date);
CREATE INDEX IF NOT EXISTS idx_calendar_events_user_date ON calendar_events(user_id, date);
CREATE INDEX IF NOT EXISTS idx_calendar_events_completed ON calendar_events(completed);

-- Verify the changes
SELECT column_name, data_type, column_default 
FROM information_schema.columns 
WHERE table_name = 'calendar_events'
ORDER BY ordinal_position;
