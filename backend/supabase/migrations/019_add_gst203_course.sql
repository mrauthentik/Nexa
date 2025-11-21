-- Add GST203 course to the courses table
-- This migration should be run BEFORE populate_gst203.sql

INSERT INTO courses (code, title, description, level,credit,active, created_at)
VALUES (
  'GST203',
  'Introduction to Philosophy and Logic',
  'A foundational course covering the basic concepts of philosophy, branches of philosophy (Metaphysics, Epistemology, Axiology, Logic), and the principles of logical reasoning including propositional logic, laws of thought, and common logical fallacies.',
  200,
  2,
  TRUE,
  NOW()
)
ON CONFLICT (code) DO NOTHING;

-- Add a comment
COMMENT ON TABLE courses IS 'Stores course information for the learning platform';
