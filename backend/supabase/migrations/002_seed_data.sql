-- Seed sample courses
INSERT INTO courses (title, code, description, department, level, is_active) VALUES
('Data Structures and Algorithms', 'CSC 201', 'Comprehensive study of data structures and algorithm design', 'Computer Science', '200', true),
('Database Management Systems', 'CSC 301', 'Introduction to database design and SQL', 'Computer Science', '300', true),
('Web Development', 'CSC 205', 'Modern web development with HTML, CSS, and JavaScript', 'Computer Science', '200', true),
('Operating Systems', 'CSC 305', 'Fundamentals of operating system design and implementation', 'Computer Science', '300', true),
('Computer Networks', 'CSC 401', 'Network protocols and architecture', 'Computer Science', '400', true),
('Software Engineering', 'CSC 501', 'Software development lifecycle and best practices', 'Computer Science', '500', true),
('Introduction to Psychology', 'PSY 101', 'Basic principles of psychology', 'Psychology', '100', true),
('Marketing Fundamentals', 'MKT 101', 'Core concepts in marketing', 'Marketing', '100', true),
('Advanced Mathematics', 'MTH 201', 'Calculus and Linear Algebra', 'Mathematics', '200', true),
('Engineering Fundamentals', 'ENG 101', 'Core engineering principles', 'Engineering', '100', true);

-- Create function to auto-create profile on signup
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.profiles (id, email, full_name, role)
    VALUES (
        NEW.id,
        NEW.email,
        COALESCE(NEW.raw_user_meta_data->>'fullName', 'User'),
        COALESCE((NEW.raw_user_meta_data->>'role')::user_role, 'student')
    );
    
    -- Create default settings
    INSERT INTO public.user_settings (user_id)
    VALUES (NEW.id);
    
    -- Create default stats
    INSERT INTO public.user_stats (user_id)
    VALUES (NEW.id);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Trigger to create profile on user signup
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();
