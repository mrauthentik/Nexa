-- Create surveys table for first-time test feedback
CREATE TABLE IF NOT EXISTS surveys (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    test_result_id UUID REFERENCES test_results(id) ON DELETE SET NULL,
    
    -- Survey questions
    overall_rating INTEGER CHECK (overall_rating >= 1 AND overall_rating <= 5),
    ease_of_use INTEGER CHECK (ease_of_use >= 1 AND ease_of_use <= 5),
    content_quality INTEGER CHECK (content_quality >= 1 AND content_quality <= 5),
    would_recommend BOOLEAN,
    
    -- Open-ended feedback
    what_liked TEXT,
    what_improved TEXT,
    additional_comments TEXT,
    
    -- Metadata
    is_first_test BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    UNIQUE(user_id, test_result_id)
);

-- Create index for faster queries
CREATE INDEX idx_surveys_user_id ON surveys(user_id);
CREATE INDEX idx_surveys_created_at ON surveys(created_at DESC);
CREATE INDEX idx_surveys_is_first_test ON surveys(is_first_test);

-- Enable RLS
ALTER TABLE surveys ENABLE ROW LEVEL SECURITY;

-- Users can insert their own surveys
CREATE POLICY "Users can insert their own surveys"
    ON surveys
    FOR INSERT
    TO authenticated
    WITH CHECK (auth.uid() = user_id);

-- Users can view their own surveys
CREATE POLICY "Users can view their own surveys"
    ON surveys
    FOR SELECT
    TO authenticated
    USING (auth.uid() = user_id);

-- Admins can view all surveys
CREATE POLICY "Admins can view all surveys"
    ON surveys
    FOR SELECT
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE profiles.id = auth.uid()
            AND profiles.role = 'admin'
        )
    );

-- Admins can delete surveys
CREATE POLICY "Admins can delete surveys"
    ON surveys
    FOR DELETE
    TO authenticated
    USING (
        EXISTS (
            SELECT 1 FROM profiles
            WHERE profiles.id = auth.uid()
            AND profiles.role = 'admin'
        )
    );
