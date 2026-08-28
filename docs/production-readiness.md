# Production Readiness Gate

## Chosen pilot configuration

- Hosting: GitHub Pages.
- Database: Supabase Postgres free tier.
- Identity: Supabase email/password with email confirmation required.
- Social identity: Google OAuth.
- Anonymous access: disabled.
- Data path: cloud only; no IndexedDB or local learner storage.
- Model: no trained model yet; current recommendations are clearly foundation placeholders.

## Account setup checklist

### Supabase

- [ ] Run `supabase/schema.sql` successfully in the SQL Editor.
- [ ] Confirm `learner_profiles` and `learning_attempts` exist.
- [ ] Confirm all RLS policies exist and are enabled.
- [ ] Enable Email provider.
- [ ] Keep email confirmation enabled for the pilot.
- [ ] Enable Google provider after entering the Google client ID and secret.
- [ ] Set Site URL to `https://vikasjangra99.github.io/orbit-learning/`.
- [ ] Add the same URL to Redirect URLs.
- [ ] Confirm password reset redirect uses the Pages URL.

### Google Cloud

- [ ] Create an OAuth consent screen.
- [ ] Add the required app name and support email.
- [ ] Create a Web application OAuth client.
- [ ] Add this authorized JavaScript origin: `https://hhomwlrsrvdleiowkrmb.supabase.co`.
- [ ] Add this authorized redirect URI: `https://hhomwlrsrvdleiowkrmb.supabase.co/auth/v1/callback`.
- [ ] Copy the client ID and client secret into Supabase Google provider settings.
- [ ] Never add the Google secret to GitHub, frontend code, or chat.

## Acceptance tests before public pilot

1. New email account receives a confirmation email.
2. Unconfirmed account cannot enter the learner app.
3. Confirmed account can sign in and is redirected to setup.
4. Setup writes exactly one profile row with the Supabase Auth user ID.
5. Refresh preserves the cloud profile.
6. Sign out returns to the landing page.
7. Sign in again returns to the same cloud profile.
8. Google sign-in creates or resumes the correct account.
9. Two accounts cannot read or write each other's profile or attempts.
10. Invalid password, duplicate email, expired confirmation, and network failure show actionable errors.
11. No service-role key or Google secret appears in source, artifact, logs, or browser code.
12. Password reset completes through a valid Pages redirect.

## Reset semantics

The repository contains no seeded learner names or fabricated progress values. Clearing browser site data removes the local Supabase session token and signs out the current browser; it does not delete cloud rows. Deleting cloud data must be an authenticated, explicit account-data operation and must not be performed as a generic cache reset.

## Current blocker

The code and deployment are prepared, but provider toggles, SQL execution, and Google credentials are account-side operations. They must be completed and verified before calling the application production ready.
