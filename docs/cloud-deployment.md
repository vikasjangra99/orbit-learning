# Cloud Deployment

## Free-tier architecture

- Frontend: GitHub Pages.
- CI/CD: GitHub Actions.
- Authentication: Supabase anonymous authentication for the first public pilot.
- Database: Supabase free Postgres.
- Database security: Supabase row-level security policies in `supabase/schema.sql`.
- AI provider: not enabled in this release.

## Required account actions

These actions require the project owner's accounts and cannot be performed without their authorization:

1. Create a Supabase project on the free tier.
2. Enable anonymous sign-ins in Supabase Auth.
3. Run `supabase/schema.sql` in the Supabase SQL Editor.
4. Copy the Supabase project URL and anon public key.
5. Create a personal GitHub repository and add this project as its remote.
6. Add repository Actions secrets named `SUPABASE_URL` and `SUPABASE_ANON_KEY`.
7. Enable GitHub Pages using GitHub Actions as the source.
8. Push the `main` branch. The workflow publishes the site and reports its Pages URL.

Never add a service-role key to frontend code, repository files, or Actions logs. The anon key is only acceptable in browser code when the SQL policies are enabled and tested.

## Current status

The project has no GitHub remote, no Supabase project configuration, and no public URL. The local `cloud-config.js` is intentionally empty. The deployment workflow will inject secrets into the published artifact; it will not publish the placeholder values from `cloud-config.example.js`.
