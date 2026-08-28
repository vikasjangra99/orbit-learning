# Cloud Deployment

## Free-tier architecture

- Frontend: GitHub Pages.
- CI/CD: GitHub Actions.
- Authentication: Supabase email/password and Google OAuth.
- Database: Supabase free Postgres.
- Database security: Supabase row-level security policies in `supabase/schema.sql`.
- AI provider: not enabled in this release.

## Required account actions

These actions require the project owner's accounts and cannot be performed without their authorization:

1. Create a Supabase project on the free tier.
2. Configure email/password sign-in and Google OAuth in Supabase Auth. Add the deployed Pages URL as an allowed redirect URL.
3. Run `supabase/schema.sql` in the Supabase SQL Editor.
4. Copy the Supabase project URL and anon public key.
5. Create a personal GitHub repository and add this project as its remote. Completed: `https://github.com/vikasjangra99/orbit-learning`.
6. Add repository Actions secrets named `SUPABASE_URL` and `SUPABASE_ANON_KEY`.
7. Enable GitHub Pages using GitHub Actions as the source. Completed.
8. Push the `main` branch. The workflow publishes the site and reports its Pages URL.

Never add a service-role key to frontend code, repository files, or Actions logs. The anon key is only acceptable in browser code when the SQL policies are enabled and tested.

## Current status

GitHub repository: `https://github.com/vikasjangra99/orbit-learning`
GitHub Pages URL: `https://vikasjangra99.github.io/orbit-learning/`

The GitHub Actions secrets are configured. The local `cloud-config.js` remains intentionally empty; the deployment workflow injects the values into the published artifact and never publishes the placeholder values from `cloud-config.example.js`.
