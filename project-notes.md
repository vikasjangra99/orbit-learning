# Orbit Learning

## Status

Current phase: Cloud foundation build
Status: Deployed for pilot setup
Last updated: 2026-08-28

Repository: https://github.com/vikasjangra99/orbit-learning
Published site: https://vikasjangra99.github.io/orbit-learning/

## Goal

Explore the touch and feel of a personal adaptive learning web app for multiple learners using placeholder content and mock progress.

## What was made

- Responsive dashboard with a calm, focused visual language.
- Three mock learner profiles: Anika, Rohan, and Meera.
- Profile switching with distinct goals, subjects, progress, and guidance.
- Today view with a recommended session and an evidence-style insight.
- Learn view with a subject library.
- Progress view with mastery signals and confidence feedback.
- Profile view with prototype settings.
- Mock mathematics session with answers, hints, feedback, and completion state.
- Mobile navigation and responsive layout.
- Interest selector for each learner, with multi-select preferences and a filtered learning library.
- Independent Git repository established so project history is isolated from the parent user directory.
- Real browser persistence added with IndexedDB learner and attempt stores.
- Cloud QA test plan created with deployment, application, RLS, privacy, accessibility, performance, and recovery gates.
- Live Playwright smoke coverage added for onboarding, first practice, feedback, and primary navigation.
- Cloud account landing flow added with email/password, Google OAuth option, session gating, and sign-out to the landing page.
- Authenticated dashboard now loads the signed-in Supabase profile and derives visible subjects/signals from saved cloud data.
- Top-right notifications and help controls now open dismissible utility panels.
- Removed all seeded learner names, demo metrics, streaks, and hard-coded progress from the active runtime and initial HTML state.

## Why it was made

The first risk is not model quality. It is whether people understand the product, want to return to it, and feel that personalization is useful. The cloud foundation now gives a small family pilot a shareable URL while the learning engine remains under development.

## What is not real yet

Adaptive mastery estimation, spaced repetition, AI APIs, analytics, and production security review are still pending. GitHub Pages deployment and Supabase cloud persistence are configured for the foundation.

Model status: no trained model exists yet. Current recommendation UI is explicitly placeholder behavior; see `docs/ai-model.md`.

Current dynamic-data status: profile domains are cloud-driven; mastery signals are calculated from stored attempts. Content and recommendation policy are still foundation-level.

Reset status: no demo learner records or fabricated dashboard metrics remain in the repository. Supabase account data is user-owned cloud data and is not deleted by source cleanup.

Cache note: Supabase Auth may keep a session token in browser site storage for reload continuity. That is not learner data. Clearing it signs out the browser; it does not delete the cloud account or profile.

## Next step

Show the prototype to several family members. Record which screens they understand, what they expect to happen next, and whether they would use it for their own subject. Convert the strongest observations into requirements before building the real learning engine.

## Change record

### 2026-08-28 - Initial experience prototype

Created the first dependency-free web prototype with mock data and local browser-only interaction.

Reason: validate product shape and interaction flow before committing to framework, backend, dataset, or AI provider.

Files created: `index.html`, `styles.css`, `app.js`, `interests.js`, `README.md`, `project-notes.md`, `decisions.md`.

Validation: static structure review and browser-oriented interaction wiring; no production claims.

GitHub: https://github.com/vikasjangra99/orbit-learning

### 2026-08-28 - Cloud deployment

Configured GitHub Pages and Supabase Actions secrets. Published site: https://vikasjangra99.github.io/orbit-learning/.

Validation: GitHub Actions deployment succeeded for the configured cloud commit; live page fetch returned the Orbit welcome page and dashboard content. Supabase schema execution and anonymous-auth enablement remain account-side setup checks. The QA plan contains 83 unique test IDs.

End-user QA: Playwright live smoke suite passed after adding the study modal's accessible dialog semantics. Two tests passed against the public Pages URL.

### 2026-08-28 - Foundation repository and persistence

Initialized an independent Git repository and added `docs/SDD.md`, `docs/architecture.md`, `aidlc-docs/aidlc-state.md`, `aidlc-docs/audit.md`, `.github/copilot-instructions.md`, `.gitignore`, `storage.js`, and `persistence-bridge.js`.

Reason: move from a visual demo to a real local-first application while preserving the documented product boundaries and audit trail.

Validation: `node --check` passed for `app.js`, `onboarding.js`, `interests.js`, `storage.js`, and `persistence-bridge.js`; all new assets are referenced by `index.html`; Git root verified as this project directory.

GitHub: not available; no remote has been created.
