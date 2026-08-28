# Orbit Learning

A cloud-first foundation for the adaptive personal learning system. It keeps the visual experience while using Supabase Auth and Postgres for learner records and practice attempts.

## Run

Use the published application: https://vikasjangra99.github.io/orbit-learning/

## Prototype flows

- Create an account or sign in with Google.
- Experience the first-use welcome page and four-step setup flow after authentication.
- Enter a name, choose multiple domains, choose a learning intention, and save them to the cloud profile.
- Explore Today, Learn, Progress, and Profile views.
- Start the available practice activity.
- Answer questions, request a hint, and see feedback.
- Resize the browser or use the mobile menu to inspect the responsive layout.

## Explicitly mocked

The foundation requires authentication and cloud connectivity. It does not include external AI calls, production security hardening, or a trained adaptive model yet. The visible recommendations and progress values remain illustrative until the adaptive domain engine is implemented.

The first-use setup is stored in the authenticated Supabase account. Sign out from Profile to return to the landing page; sign in again to resume the same cloud profile.

## Project record

See `docs/SDD.md` for requirements, `docs/architecture.md` for boundaries, `project-notes.md` for the current overview, `decisions.md` for product decisions, and `aidlc-docs/audit.md` for the implementation record.