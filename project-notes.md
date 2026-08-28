# Orbit Learning Prototype

## Status

Current phase: Phase 0 - experience prototype
Status: In progress
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

## Why it was made

The first risk is not model quality. It is whether people understand the product, want to return to it, and feel that personalization is useful. This prototype lets a small family pilot react to the experience before real content, storage, and AI infrastructure are selected.

## What is not real yet

Authentication, cloud synchronization, adaptive mastery estimation, spaced repetition, AI APIs, security implementation, analytics, and production deployment are intentionally excluded from this phase. Browser IndexedDB persistence is now included.

## Next step

Show the prototype to several family members. Record which screens they understand, what they expect to happen next, and whether they would use it for their own subject. Convert the strongest observations into requirements before building the real learning engine.

## Change record

### 2026-08-28 - Initial experience prototype

Created the first dependency-free web prototype with mock data and local browser-only interaction.

Reason: validate product shape and interaction flow before committing to framework, backend, dataset, or AI provider.

Files created: `index.html`, `styles.css`, `app.js`, `interests.js`, `README.md`, `project-notes.md`, `decisions.md`.

Validation: static structure review and browser-oriented interaction wiring; no production claims.

GitHub: https://github.com/vikasjangra99/orbit-learning

### 2026-08-28 - Foundation repository and persistence

Initialized an independent Git repository and added `docs/SDD.md`, `docs/architecture.md`, `aidlc-docs/aidlc-state.md`, `aidlc-docs/audit.md`, `.github/copilot-instructions.md`, `.gitignore`, `storage.js`, and `persistence-bridge.js`.

Reason: move from a visual demo to a real local-first application while preserving the documented product boundaries and audit trail.

Validation: `node --check` passed for `app.js`, `onboarding.js`, `interests.js`, `storage.js`, and `persistence-bridge.js`; all new assets are referenced by `index.html`; Git root verified as this project directory.

GitHub: not available; no remote has been created.
