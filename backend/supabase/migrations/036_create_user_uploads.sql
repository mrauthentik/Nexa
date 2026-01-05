-- Create table for user uploads (PDFs, etc converted to text)
create table public.user_uploads (
  id uuid default gen_random_uuid() primary key,
  user_id uuid references public.profiles(id) on delete cascade not null,
  title text not null,
  content text not null, -- The extracted text
  file_type text default 'pdf',
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- Enable RLS
alter table public.user_uploads enable row level security;

-- Policies
create policy "Users can view their own uploads"
  on public.user_uploads for select
  using (auth.uid() = user_id);

create policy "Users can insert their own uploads"
  on public.user_uploads for insert
  with check (auth.uid() = user_id);

create policy "Users can delete their own uploads"
  on public.user_uploads for delete
  using (auth.uid() = user_id);
