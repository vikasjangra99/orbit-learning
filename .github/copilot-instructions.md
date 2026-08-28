# Orbit Learning Engineering Instructions

Read `docs/SDD.md`, `project-notes.md`, and `decisions.md` before making product or architecture changes. Read `aidlc-docs/aidlc-state.md` before starting a workflow stage.

## Working rules

- Treat `docs/SDD.md` as the product and technical source of truth.
- Keep the current phase explicit: prototype, foundation, or production.
- Make the smallest focused change that satisfies a requirement.
- Before editing, state the local hypothesis and the cheapest check that could disprove it.
- After every substantive edit, run the narrowest executable validation available before further exploration.
- Recheck the entire touched path after each change.
- Keep presentation, domain behavior, and persistence boundaries separate.
- Every learner-owned record requires a learner ID. Never use display names as identifiers.
- Do not send learner data to external services in the foundation release.
- Do not let an LLM silently determine mastery, progression, or factual correctness.
- Do not invent datasets, metrics, GitHub links, commits, issues, or pull requests.
- Record why a meaningful change was made, what files changed, what validation ran, and current Git/GitHub provenance.
- Never write secrets, tokens, passwords, or unnecessary personal data to logs or audit files.
- Update `project-notes.md` for user-visible work and `decisions.md` for durable choices.
- Update `aidlc-docs/aidlc-state.md` and append `aidlc-docs/audit.md` when a workflow stage or meaningful implementation change completes.

## Validation baseline

Run JavaScript syntax checks with `node --check` for every changed JavaScript file. Verify local asset references. Test onboarding, profile separation, persistence, practice attempts, export/import, and deletion before calling the foundation release complete.

## Scope discipline

Security and cloud readiness are deferred only for the foundation sequence, not waived. Mark deferred checks explicitly and complete them before real users, accounts, or cloud services are introduced.
