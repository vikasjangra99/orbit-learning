# Orbit Learning Architecture

## Foundation Runtime

```text
Browser
  -> Presentation: HTML, CSS, interaction controllers
  -> Domain behavior: learner context, content, attempts, recommendations
  -> Authentication: Supabase Auth
  -> Persistence boundary: OrbitCloud
  -> Supabase Postgres: learner_profiles, learning_attempts
```

The application is cloud-first. The browser is a presentation and API-client surface; learner data is not stored in a local database.

## Storage Contract

`supabase/schema.sql` owns the cloud schema. It contains:

- `learner_profiles`, keyed by the Supabase Auth user ID.
- `learning_attempts`, keyed by ID, with an index on `learner_id`.

The persistence bridge uses the authenticated Supabase user ID. There is no local database fallback in the cloud application.

## Browser Session Cache

Supabase's browser client stores the authenticated session token in browser site storage so a reload can restore login. This token is authentication state, not learner data. Clearing site data signs the browser out; it does not delete the cloud profile or attempts. Learner records remain in Supabase Postgres.

## Future Boundaries

Cloud authentication and storage are active. Threat modeling, data classification, deletion, backup, IAM, encryption, cost, and regional data requirements remain production gates.

An AI service will be an optional integration boundary. The deterministic learning engine must remain usable without it.
