-- Create a table to store Learn Your Way generated content
create table public.learn_modules (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references public.profiles(id) on delete cascade not null,
  title text not null,
  course_code text, -- e.g. CIT211
  source_type text check (source_type in ('summary', 'upload')), -- where it came from
  source_id text, -- ID of the summary or uploaded file
  content_type text check (content_type in ('audio', 'quiz', 'mindmap')),
  content jsonb not null, -- The generated content (script, questions, nodes/edges)
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable RLS
alter table public.learn_modules enable row level security;

-- Policies
create policy "Users can view their own learn modules"
  on public.learn_modules for select
  using (auth.uid() = user_id);

create policy "Users can insert their own learn modules"
  on public.learn_modules for insert
  with check (auth.uid() = user_id);

create policy "Users can delete their own learn modules"
  on public.learn_modules for delete
  using (auth.uid() = user_id);
