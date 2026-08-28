# Orbit Learning

A dependency-free local-first foundation for the adaptive personal learning system. It keeps the visual prototype experience while adding real browser persistence for learner records and practice attempts.

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

The foundation does not include authentication, cloud synchronization, external AI calls, or production security controls. It uses IndexedDB as a real local database. The visible recommendations and progress values remain illustrative until the adaptive domain engine is implemented.

The first-use setup is stored locally so a returning visitor can resume the learning space. Use the browser's site-data controls to replay the first-use journey during this foundation stage. This is local persistence, not production account storage.

## Project record

See `docs/SDD.md` for requirements, `docs/architecture.md` for boundaries, `project-notes.md` for the current overview, `decisions.md` for product decisions, and `aidlc-docs/audit.md` for the implementation record.