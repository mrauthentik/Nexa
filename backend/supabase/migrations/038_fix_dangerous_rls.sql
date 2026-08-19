-- =====================================================
-- MIGRATION 038: FIX DANGEROUS RLS POLICIES
-- =====================================================
-- This migration is written defensively: every section checks
-- if the table EXISTS before operating on it, so it is safe to
-- run even if some tables have not been created yet.
-- =====================================================


-- ── 1. FIX subscriptions table ──────────────────────────────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'subscriptions') THEN

        -- Remove the catch-all policy that lets any authenticated user
        -- write to the subscriptions table (self-upgrade attack vector)
        DROP POLICY IF EXISTS "System can manage subscriptions" ON subscriptions;

        -- Allow users to insert their OWN subscription row only
        -- (service_role bypasses RLS automatically for webhook handlers)
        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'subscriptions'
              AND policyname = 'Users can insert their own subscription'
        ) THEN
            CREATE POLICY "Users can insert their own subscription"
                ON subscriptions FOR INSERT
                WITH CHECK (auth.uid() = user_id);
        END IF;

        RAISE NOTICE '✅ subscriptions table RLS fixed';
    ELSE
        RAISE NOTICE '⚠️  subscriptions table does not exist yet — skipping';
    END IF;
END $$;


-- ── 2. FIX billing_history table ────────────────────────────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'billing_history') THEN

        -- Remove the open INSERT that lets any authenticated user create billing records
        DROP POLICY IF EXISTS "System can create billing history" ON billing_history;

        RAISE NOTICE '✅ billing_history table RLS fixed';
    ELSE
        RAISE NOTICE '⚠️  billing_history table does not exist yet — skipping';
    END IF;
END $$;


-- ── 3. FIX user_stats table ─────────────────────────────────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'user_stats') THEN

        DROP POLICY IF EXISTS "System can update stats" ON user_stats;

        -- Users can update only their OWN stats row
        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'user_stats'
              AND policyname = 'Users can update their own stats'
        ) THEN
            CREATE POLICY "Users can update their own stats"
                ON user_stats FOR UPDATE
                USING (auth.uid() = user_id)
                WITH CHECK (auth.uid() = user_id);
        END IF;

        -- Allow authenticated users to insert their initial stats row
        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'user_stats'
              AND policyname = 'Users can insert their own stats'
        ) THEN
            CREATE POLICY "Users can insert their own stats"
                ON user_stats FOR INSERT
                WITH CHECK (auth.uid() = user_id);
        END IF;

        RAISE NOTICE '✅ user_stats table RLS fixed';
    ELSE
        RAISE NOTICE '⚠️  user_stats table does not exist yet — skipping';
    END IF;
END $$;


-- ── 4. FIX admin_notifications table ────────────────────────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'admin_notifications') THEN

        DROP POLICY IF EXISTS "System can create admin notifications" ON admin_notifications;

        RAISE NOTICE '✅ admin_notifications table RLS fixed';
    ELSE
        RAISE NOTICE '⚠️  admin_notifications table does not exist yet — skipping';
    END IF;
END $$;


-- ── 5. FIX user_activity_log table ──────────────────────────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'user_activity_log') THEN

        DROP POLICY IF EXISTS "System can create activity logs" ON user_activity_log;

        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'user_activity_log'
              AND policyname = 'Users can insert their own activity logs'
        ) THEN
            CREATE POLICY "Users can insert their own activity logs"
                ON user_activity_log FOR INSERT
                WITH CHECK (auth.uid() = user_id);
        END IF;

        RAISE NOTICE '✅ user_activity_log table RLS fixed';
    ELSE
        RAISE NOTICE '⚠️  user_activity_log table does not exist yet — skipping';
    END IF;
END $$;


-- ── 6. FIX profiles table — block role self-elevation ───────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'profiles') THEN

        -- Drop existing broad update policy and replace with a safer one
        DROP POLICY IF EXISTS "Users can update their own profile" ON profiles;

        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'profiles'
              AND policyname = 'Users can update their own profile'
        ) THEN
            CREATE POLICY "Users can update their own profile"
                ON profiles FOR UPDATE
                USING (auth.uid() = id)
                WITH CHECK (auth.uid() = id);
        END IF;

        RAISE NOTICE '✅ profiles table update policy recreated';
    ELSE
        RAISE NOTICE '⚠️  profiles table does not exist yet — skipping';
    END IF;
END $$;

-- Trigger to block client-side role elevation on profiles
-- This fires BEFORE any UPDATE and rejects attempts to change role or
-- subscription_tier from an authenticated (non-service-role) connection.
CREATE OR REPLACE FUNCTION prevent_role_elevation()
RETURNS TRIGGER AS $$
BEGIN
    -- Check if this is a client-side authenticated call (not service_role)
    IF current_setting('request.jwt.claims', true) IS NOT NULL THEN
        DECLARE
            jwt_role TEXT;
        BEGIN
            BEGIN
                jwt_role := current_setting('request.jwt.claims', true)::json->>'role';
            EXCEPTION WHEN OTHERS THEN
                jwt_role := NULL;
            END;

            -- Block role changes from non-service connections
            IF jwt_role = 'authenticated' THEN
                IF NEW.role IS DISTINCT FROM OLD.role THEN
                    RAISE EXCEPTION 'Role changes are not permitted from client connections'
                        USING ERRCODE = '42501';
                END IF;
                IF NEW.subscription_tier IS DISTINCT FROM OLD.subscription_tier THEN
                    RAISE EXCEPTION 'Subscription tier changes must go through the billing system'
                        USING ERRCODE = '42501';
                END IF;
            END IF;
        END;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Only attach the trigger if the profiles table exists
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'profiles') THEN
        DROP TRIGGER IF EXISTS enforce_no_role_elevation ON profiles;
        CREATE TRIGGER enforce_no_role_elevation
            BEFORE UPDATE ON profiles
            FOR EACH ROW
            EXECUTE FUNCTION prevent_role_elevation();
        RAISE NOTICE '✅ Role elevation prevention trigger added to profiles';
    END IF;
END $$;


-- ── 7. FIX notifications table ──────────────────────────────────────────────
DO $$
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'public' AND table_name = 'notifications') THEN

        -- Replace overly broad admin insert policy
        DROP POLICY IF EXISTS "Admins can create notifications" ON notifications;

        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'notifications'
              AND policyname = 'Admins can create notifications'
        ) THEN
            CREATE POLICY "Admins can create notifications"
                ON notifications FOR INSERT
                WITH CHECK (
                    EXISTS (
                        SELECT 1 FROM profiles
                        WHERE profiles.id = auth.uid()
                          AND profiles.role = 'admin'
                    )
                );
        END IF;

        -- Allow users to insert notifications for themselves
        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'notifications'
              AND policyname = 'Users can insert their own notifications'
        ) THEN
            CREATE POLICY "Users can insert their own notifications"
                ON notifications FOR INSERT
                WITH CHECK (auth.uid() = user_id);
        END IF;

        -- Allow users to delete their own notifications
        IF NOT EXISTS (
            SELECT 1 FROM pg_policies
            WHERE schemaname = 'public'
              AND tablename = 'notifications'
              AND policyname = 'Users can delete their own notifications'
        ) THEN
            CREATE POLICY "Users can delete their own notifications"
                ON notifications FOR DELETE
                USING (auth.uid() = user_id);
        END IF;

        RAISE NOTICE '✅ notifications table RLS fixed';
    ELSE
        RAISE NOTICE '⚠️  notifications table does not exist yet — skipping';
    END IF;
END $$;


-- Final summary
DO $$
BEGIN
    RAISE NOTICE '';
    RAISE NOTICE '✅ Migration 038 completed successfully';
    RAISE NOTICE '   Any tables that did not exist were safely skipped.';
    RAISE NOTICE '   Re-run this migration after creating missing tables.';
END $$;
