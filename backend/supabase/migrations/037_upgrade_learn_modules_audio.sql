-- Migration: Upgrade learn_modules for intelligent audio features
-- Adds: key_points (JSONB), audio_mode, audio_url columns

-- Add key_points column to store extracted key concepts (avoids re-extraction)
alter table public.learn_modules
  add column if not exists key_points jsonb default null;

-- Add audio_mode to track whether this was a 'full' or 'key-points' generation
alter table public.learn_modules
  add column if not exists audio_mode text default 'full' check (audio_mode in ('full', 'key-points'));

-- Add audio_url to store the ElevenLabs TTS generated audio URL (base64 data URI or hosted URL)
alter table public.learn_modules
  add column if not exists audio_url text default null;

-- Add word_count for estimated listen time calculations
alter table public.learn_modules
  add column if not exists word_count integer default null;

-- Comment documenting the schema
comment on column public.learn_modules.key_points is 'Structured key points extracted by AI in Phase 1 of the two-stage pipeline. Stored as JSONB to avoid re-extraction on future regenerations.';
comment on column public.learn_modules.audio_mode is 'The mode used to generate this audio module: full (entire document) or key-points (AI-selected highlights).';
comment on column public.learn_modules.audio_url is 'Base64 data URI or hosted URL of the ElevenLabs TTS audio for this module.';
comment on column public.learn_modules.word_count is 'Word count of the generated script, used to calculate estimated listen time.';
