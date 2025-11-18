-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create custom types
CREATE TYPE user_role AS ENUM ('student', 'admin');
CREATE TYPE difficulty_level AS ENUM ('Beginner', 'Intermediate', 'Advanced');
CREATE TYPE test_status AS ENUM ('draft', 'active', 'archived');
CREATE TYPE submission_status AS ENUM ('in_progress', 'submitted', 'graded');
CREATE TYPE notification_type AS ENUM ('assignment', 'exam', 'grade', 'announcement', 'system');
CREATE TYPE priority_level AS ENUM ('low', 'medium', 'high');

-- Users table (extends Supabase auth.users)
CREATE TABLE profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT UNIQUE NOT NULL,
    full_name TEXT NOT NULL,
    role user_role DEFAULT 'student',
    student_id TEXT UNIQUE,
    department TEXT,
    level TEXT,
    phone TEXT,
    avatar_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Courses table
CREATE TABLE courses (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    code TEXT UNIQUE NOT NULL,
    description TEXT,
    department TEXT,
    level TEXT,
    credits INTEGER DEFAULT 3,
    is_active BOOLEAN DEFAULT true,
    created_by UUID REFERENCES profiles(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Summaries table
CREATE TABLE summaries (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
    course_code TEXT NOT NULL,
    category TEXT,
    description TEXT,
    difficulty difficulty_level DEFAULT 'Beginner',
    read_time TEXT,
    is_premium BOOLEAN DEFAULT false,
    thumbnail TEXT,
    created_by UUID REFERENCES profiles(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Summary sections
CREATE TABLE summary_sections (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    summary_id UUID REFERENCES summaries(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    order_index INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Summary topics
CREATE TABLE summary_topics (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    section_id UUID REFERENCES summary_sections(id) ON DELETE CASCADE,
    subtitle TEXT NOT NULL,
    content TEXT NOT NULL,
    order_index INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tests/Exams table
CREATE TABLE tests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    course_id UUID REFERENCES courses(id) ON DELETE CASCADE,
    course_code TEXT NOT NULL,
    description TEXT,
    duration INTEGER NOT NULL, -- in minutes
    total_questions INTEGER NOT NULL,
    passing_score INTEGER DEFAULT 70,
    difficulty difficulty_level DEFAULT 'Intermediate',
    status test_status DEFAULT 'draft',
    is_premium BOOLEAN DEFAULT false,
    created_by UUID REFERENCES profiles(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Questions table
CREATE TABLE questions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    test_id UUID REFERENCES tests(id) ON DELETE CASCADE,
    question TEXT NOT NULL,
    options JSONB NOT NULL, -- Array of options
    correct_answer INTEGER NOT NULL, -- Index of correct option
    explanation TEXT,
    order_index INTEGER NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Test submissions
CREATE TABLE test_submissions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    test_id UUID REFERENCES tests(id) ON DELETE CASCADE,
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    answers JSONB NOT NULL, -- {questionId: selectedOption}
    score INTEGER,
    percentage DECIMAL(5,2),
    time_taken INTEGER, -- in seconds
    status submission_status DEFAULT 'in_progress',
    started_at TIMESTAMPTZ DEFAULT NOW(),
    submitted_at TIMESTAMPTZ,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- User progress tracking
CREATE TABLE user_progress (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    summary_id UUID REFERENCES summaries(id) ON DELETE CASCADE,
    progress_percentage INTEGER DEFAULT 0,
    completed_sections JSONB DEFAULT '[]',
    last_accessed TIMESTAMPTZ DEFAULT NOW(),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, summary_id)
);

-- Schedule/Classes table
CREATE TABLE schedule_classes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    course_code TEXT,
    instructor TEXT,
    location TEXT,
    day_of_week INTEGER NOT NULL, -- 0-6 (Mon-Sun)
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    color TEXT DEFAULT 'bg-blue-500',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Assignments table
CREATE TABLE assignments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    title TEXT NOT NULL,
    course_code TEXT,
    description TEXT,
    due_date TIMESTAMPTZ NOT NULL,
    priority priority_level DEFAULT 'medium',
    completed BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Study sessions
CREATE TABLE study_sessions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    subject TEXT NOT NULL,
    duration INTEGER NOT NULL, -- in minutes
    scheduled_date DATE NOT NULL,
    scheduled_time TIME NOT NULL,
    goals TEXT,
    completed BOOLEAN DEFAULT false,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Notifications table
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    type notification_type NOT NULL,
    title TEXT NOT NULL,
    message TEXT NOT NULL,
    read BOOLEAN DEFAULT false,
    link TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- User settings
CREATE TABLE user_settings (
    user_id UUID PRIMARY KEY REFERENCES profiles(id) ON DELETE CASCADE,
    email_notifications BOOLEAN DEFAULT true,
    test_reminders BOOLEAN DEFAULT true,
    score_updates BOOLEAN DEFAULT true,
    system_updates BOOLEAN DEFAULT false,
    language TEXT DEFAULT 'en',
    timezone TEXT DEFAULT 'Africa/Lagos',
    theme TEXT DEFAULT 'light',
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Analytics/Stats table
CREATE TABLE user_stats (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
    total_tests_taken INTEGER DEFAULT 0,
    average_score DECIMAL(5,2) DEFAULT 0,
    total_study_hours INTEGER DEFAULT 0,
    streak_days INTEGER DEFAULT 0,
    last_activity TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id)
);

-- Create indexes for better performance
CREATE INDEX idx_profiles_email ON profiles(email);
CREATE INDEX idx_profiles_role ON profiles(role);
CREATE INDEX idx_summaries_course_code ON summaries(course_code);
CREATE INDEX idx_summaries_category ON summaries(category);
CREATE INDEX idx_tests_course_code ON tests(course_code);
CREATE INDEX idx_tests_status ON tests(status);
CREATE INDEX idx_test_submissions_user ON test_submissions(user_id);
CREATE INDEX idx_test_submissions_test ON test_submissions(test_id);
CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_read ON notifications(read);
CREATE INDEX idx_user_progress_user ON user_progress(user_id);

-- Create updated_at trigger function
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply updated_at triggers
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON profiles FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_courses_updated_at BEFORE UPDATE ON courses FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_summaries_updated_at BEFORE UPDATE ON summaries FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_tests_updated_at BEFORE UPDATE ON tests FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_schedule_classes_updated_at BEFORE UPDATE ON schedule_classes FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_assignments_updated_at BEFORE UPDATE ON assignments FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_user_settings_updated_at BEFORE UPDATE ON user_settings FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
CREATE TRIGGER update_user_stats_updated_at BEFORE UPDATE ON user_stats FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Row Level Security (RLS) Policies

-- Enable RLS on all tables
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE summaries ENABLE ROW LEVEL SECURITY;
ALTER TABLE summary_sections ENABLE ROW LEVEL SECURITY;
ALTER TABLE summary_topics ENABLE ROW LEVEL SECURITY;
ALTER TABLE tests ENABLE ROW LEVEL SECURITY;
ALTER TABLE questions ENABLE ROW LEVEL SECURITY;
ALTER TABLE test_submissions ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_progress ENABLE ROW LEVEL SECURITY;
ALTER TABLE schedule_classes ENABLE ROW LEVEL SECURITY;
ALTER TABLE assignments ENABLE ROW LEVEL SECURITY;
ALTER TABLE study_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_stats ENABLE ROW LEVEL SECURITY;

-- Profiles policies
CREATE POLICY "Users can view their own profile" ON profiles FOR SELECT USING (auth.uid() = id);
CREATE POLICY "Users can update their own profile" ON profiles FOR UPDATE USING (auth.uid() = id);
CREATE POLICY "Admins can view all profiles" ON profiles FOR SELECT USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Courses policies
CREATE POLICY "Anyone can view active courses" ON courses FOR SELECT USING (is_active = true);
CREATE POLICY "Admins can manage courses" ON courses FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Summaries policies
CREATE POLICY "Users can view summaries" ON summaries FOR SELECT USING (true);
CREATE POLICY "Admins can manage summaries" ON summaries FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Summary sections and topics policies
CREATE POLICY "Users can view summary sections" ON summary_sections FOR SELECT USING (true);
CREATE POLICY "Users can view summary topics" ON summary_topics FOR SELECT USING (true);
CREATE POLICY "Admins can manage sections" ON summary_sections FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');
CREATE POLICY "Admins can manage topics" ON summary_topics FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Tests policies
CREATE POLICY "Users can view active tests" ON tests FOR SELECT USING (status = 'active');
CREATE POLICY "Admins can manage tests" ON tests FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Questions policies
CREATE POLICY "Users can view questions of active tests" ON questions FOR SELECT USING (
    EXISTS (SELECT 1 FROM tests WHERE tests.id = questions.test_id AND tests.status = 'active')
);
CREATE POLICY "Admins can manage questions" ON questions FOR ALL USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- Test submissions policies
CREATE POLICY "Users can view their own submissions" ON test_submissions FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can create their own submissions" ON test_submissions FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update their own submissions" ON test_submissions FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Admins can view all submissions" ON test_submissions FOR SELECT USING ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- User progress policies
CREATE POLICY "Users can manage their own progress" ON user_progress FOR ALL USING (auth.uid() = user_id);

-- Schedule classes policies
CREATE POLICY "Users can manage their own schedule" ON schedule_classes FOR ALL USING (auth.uid() = user_id);

-- Assignments policies
CREATE POLICY "Users can manage their own assignments" ON assignments FOR ALL USING (auth.uid() = user_id);

-- Study sessions policies
CREATE POLICY "Users can manage their own study sessions" ON study_sessions FOR ALL USING (auth.uid() = user_id);

-- Notifications policies
CREATE POLICY "Users can view their own notifications" ON notifications FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users can update their own notifications" ON notifications FOR UPDATE USING (auth.uid() = user_id);
CREATE POLICY "Admins can create notifications" ON notifications FOR INSERT WITH CHECK ((SELECT role FROM profiles WHERE id = auth.uid()) = 'admin');

-- User settings policies
CREATE POLICY "Users can manage their own settings" ON user_settings FOR ALL USING (auth.uid() = user_id);

-- User stats policies
CREATE POLICY "Users can view their own stats" ON user_stats FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "System can update stats" ON user_stats FOR ALL USING (true);
