# Orbit Learning Architecture

## Foundation Runtime

```text
Browser
  -> Presentation: HTML, CSS, interaction controllers
  -> Domain behavior: learner context, content, attempts, recommendations
  -> Persistence boundary: OrbitStore
  -> IndexedDB: learners, attempts
```

The current application is deliberately dependency-free. This makes the foundation easy to run locally and keeps the first domain behavior inspectable. The visual prototype remains the presentation reference, while persistence is now a real browser database rather than hard-coded mock state.

## Storage Contract

`storage.js` owns IndexedDB setup and CRUD operations. The database is named `orbit-learning`, version 1. It contains:

- `learners`, keyed by `id`.
- `attempts`, keyed by `id`, with an index on `learnerId`.

The persistence bridge creates a distinct learner record when onboarding completes and records practice attempts. Local storage is used only for the current demo's onboarding flag and setup handoff; it is not treated as an account system.

## Future Boundaries

A future cloud service can implement the same repository contract behind authentication and authorization. It must not be introduced until threat modeling, data classification, deletion, backup, IAM, encryption, cost, and regional data requirements are approved.

An AI service will be an optional integration boundary. The deterministic learning engine must remain usable without it.
