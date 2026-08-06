-- =====================================================
-- MIGRATION 039: AUDIO STORAGE PATH COLUMN
-- =====================================================
-- Problem: ElevenLabs audio was stored as a base64 data URI
-- directly in the audio_url TEXT column, causing massive row bloat
-- (300-500KB per row). PostgreSQL is not a CDN.
--
-- Fix: Add a dedicated audio_storage_path column to store the
-- Supabase Storage object path. The Edge Function now uploads audio
-- to the 'audio-modules' storage bucket and stores the path here.
-- The frontend fetches a signed/public URL on demand.
-- =====================================================

-- Add storage path column (replaces audio_url for new content)
ALTER TABLE public.learn_modules
    ADD COLUMN IF NOT EXISTS audio_storage_path TEXT DEFAULT NULL;

-- Keep audio_url for backward compatibility with existing records,
-- but new records will use audio_storage_path.
-- A background job can migrate old base64 data later.

-- Index for quick lookups by user + content type
CREATE INDEX IF NOT EXISTS idx_learn_modules_user_type
    ON public.learn_modules (user_id, content_type);

-- Create the storage bucket for audio files (idempotent)
-- NOTE: Run this in Supabase dashboard or via supabase CLI:
-- supabase storage create-bucket audio-modules --public

-- Add helpful comments
COMMENT ON COLUMN public.learn_modules.audio_storage_path IS
    'Supabase Storage object path for the TTS audio file (e.g., user-id/module-id.mp3). '
    'Use supabase.storage.from(''audio-modules'').getPublicUrl(path) to get the URL. '
    'Replaces the old base64 audio_url approach to prevent row bloat.';

COMMENT ON COLUMN public.learn_modules.audio_url IS
    'DEPRECATED: Legacy base64 data URI for old audio modules. '
    'New modules use audio_storage_path instead. '
    'Can be cleared after migrating old records to storage.';

DO $$
BEGIN
    RAISE NOTICE '✅ Migration 039 complete: Audio storage path column added';
    RAISE NOTICE '   - audio_storage_path TEXT column added to learn_modules';
    RAISE NOTICE '   - Remember to create the audio-modules storage bucket in Supabase dashboard';
    RAISE NOTICE '   - Remember to set bucket to public or configure signed URLs';
END $$;
