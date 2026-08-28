# Orbit Learning

A cloud-first foundation for the adaptive personal learning system. It keeps the visual experience while using Supabase Auth and Postgres for learner records and practice attempts.

## Run

Open `index.html` in a browser. No installation or server is required.

## Prototype flows

- Switch between three learner profiles.
- Experience the first-use welcome page and four-step setup flow.
- Enter a name, choose multiple domains, choose a learning intention, and enter a personalized space.
- Explore Today, Learn, Progress, and Profile views.
- Start a mock mathematics practice session.
- Answer questions, request a hint, and see feedback.
- Resize the browser or use the mobile menu to inspect the responsive layout.

## Explicitly mocked

The foundation requires authentication and cloud connectivity. It does not include external AI calls, production security hardening, or a trained adaptive model yet. The visible recommendations and progress values remain illustrative until the adaptive domain engine is implemented.

The first-use setup is stored in the authenticated Supabase account. Sign out from Profile to return to the landing page; sign in again to resume the same cloud profile.

## Project record

See `docs/SDD.md` for requirements, `docs/architecture.md` for boundaries, `project-notes.md` for the current overview, `decisions.md` for product decisions, and `aidlc-docs/audit.md` for the implementation record.