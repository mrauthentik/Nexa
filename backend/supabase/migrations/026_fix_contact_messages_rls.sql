-- Fix RLS policies for contact_messages table
-- Drop existing policies
DROP POLICY IF EXISTS "Anyone can send contact messages" ON contact_messages;
DROP POLICY IF EXISTS "Authenticated users can view contact messages" ON contact_messages;
DROP POLICY IF EXISTS "Authenticated users can update contact messages" ON contact_messages;

-- Policy: Allow anonymous and authenticated users to insert contact messages
CREATE POLICY "Allow public to send contact messages"
    ON contact_messages
    FOR INSERT
    TO public
    WITH CHECK (true);

-- Policy: Only authenticated users can view contact messages
CREATE POLICY "Allow authenticated users to view contact messages"
    ON contact_messages
    FOR SELECT
    TO authenticated
    USING (true);

-- Policy: Only authenticated users can update contact messages
CREATE POLICY "Allow authenticated users to update contact messages"
    ON contact_messages
    FOR UPDATE
    TO authenticated
    USING (true);

-- Policy: Only authenticated users can delete contact messages
CREATE POLICY "Allow authenticated users to delete contact messages"
    ON contact_messages
    FOR DELETE
    TO authenticated
    USING (true);

-- Add comment
COMMENT ON TABLE contact_messages IS 'Stores contact form submissions from users. Public can insert, authenticated users can manage.';
