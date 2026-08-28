-- DESTRUCTIVE: remove all Orbit learner data from this Supabase project.
-- Run only in the intended project: hhomwlrsrvdleiowkrmb.
-- This removes profiles and attempts, but not Supabase Auth users.

begin;
truncate table public.learning_attempts;
truncate table public.learner_profiles;
commit;

-- After running this SQL, delete test identities separately:
-- Supabase Dashboard > Authentication > Users > select test users > Delete user.
