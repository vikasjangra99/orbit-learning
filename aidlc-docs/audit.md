# AI-SDLC Audit Log

This log records project actions and decisions. Sensitive values such as passwords, API keys, tokens, and unnecessary personal data must never be written here. When a request contains sensitive data, record a redacted form and the reason.

## Foundation Build Started
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "we are done with the prototype. real project comes up now. real repository. make no mistake. recheck the project everytime you make. verify it."
**AI Response**: Inspected the project tree, detected that the prototype directory was not an independent Git repository, and confirmed the parent repository was unrelated. Began an independent foundation repository and documentation set.
**Context**: Construction foundation; repository boundary and verification policy.
**Files**: `.gitignore`, `docs/SDD.md`, `aidlc-docs/aidlc-state.md`, `aidlc-docs/audit.md`.
**Validation**: Existing project diagnostics reported no errors; repository baseline inspected.
**GitHub**: Not available; no remote has been created.

---

## Cloud Knowledge Base Implemented
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "ok. don't give me recommendations, but give me the solutions. and you have to get the data for the tools as well. dont ask me. get the content as well. for learning."
**AI Response**: Added `supabase/knowledge-base.sql` with a versioned `learning_items` table and approved starter content for Mathematics and Indian Contract Law. Added cloud querying and recommendation wiring so Start loads approved items from the learner's saved domains and records item provenance.
**Context**: Construction; content and recommendation foundation.
**Decision Logic**: Removed hard-coded placeholder questions. Legal items use original wording and official India Code homepage provenance; no stale deep URL is claimed. Content is visible only when marked approved.
**Files**: `supabase/knowledge-base.sql`, `cloud-client.js`, `knowledge-engine.js`, `persistence-bridge.js`, `app.js`, `index.html`, `docs/SDD.md`, `docs/production-readiness.md`, `project-notes.md`.
**Validation**: JavaScript syntax checks passed; schema and idempotent seed conflict handling verified. Supabase execution and live content retrieval remain pending.
**GitHub**: Pending publication; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## Cloud Deployment Verified
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "done. continue ahead"
**AI Response**: Verified GitHub Actions secrets by name, triggered deployment, corrected a PostgreSQL migration syntax defect, pushed commit `af2bd7f`, and verified the deployed site content.
**Context**: Construction; cloud deployment verification.
**Files**: `supabase/schema.sql`, `project-notes.md`.
**Validation**: GitHub Actions run `33195477094` completed successfully; latest schema-fix run `33195512735` was queued at verification time; live URL fetch returned the Orbit welcome page and dashboard content.
**GitHub**: Repository `https://github.com/vikasjangra99/orbit-learning`; Pages `https://vikasjangra99.github.io/orbit-learning/`; schema fix commit `af2bd7f`.
**Remaining Gate**: Apply `supabase/schema.sql` and enable anonymous sign-ins in the Supabase dashboard before treating cloud data writes as ready.

---

## Runtime Repair Verified
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "done. continue ahead"
**AI Response**: Rechecked the current tree after an intervening change, found that `index.html` referenced a missing `app.js`, reconstructed the required runtime from the last committed behavior, and validated the repaired tree.
**Context**: Construction; post-deployment repository integrity check.
**Files**: `app.js`.
**Validation**: All JavaScript files pass `node --check`; editor diagnostics report no errors; `index.html` dependencies are present.
**GitHub**: Repair pending publication in the next commit; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## QA Test Plan Created
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "verify that. Now be a QA Tester, provide me all the test cases that you would like to get. for example, starting from when we push a product for deployment. what do we test in all that."
**AI Response**: Verified the deployed baseline and created `docs/qa-test-plan.md` covering source checks, CI, deployment, Pages, Supabase schema/auth/RLS, learner workflows, data recovery, security/privacy, accessibility, performance, monitoring, severity, and release gates.
**Context**: QA planning for cloud foundation.
**Validation**: Latest three GitHub Actions runs succeeded; live Pages content was reachable; repository was clean; VS Code diagnostics reported no errors; all JavaScript syntax checks passed; QA plan contains 83 unique test IDs.
**GitHub**: QA plan pending publication in the next commit; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## End-User QA Executed
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "I want you to test that as a end user is testing. he should be able to see it through and thorugh"
**AI Response**: Added Playwright live smoke coverage, ran it against the public Pages URL, fixed the study modal accessibility role found during the first run, and reran the suite.
**Context**: QA execution against deployed cloud foundation.
**Files**: `tests/e2e-smoke.spec.js`, `index.html`, `docs/qa-test-plan.md`, `project-notes.md`.
**Validation**: Final live suite result: 2 passed in 6.3 seconds. All JavaScript syntax checks passed; VS Code diagnostics report no errors. An unrelated user-level npm audit reports vulnerabilities in packages outside this repository's tracked files.
**GitHub**: QA changes pending publication; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## QA Reproducibility Completed
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "I want you to test that as a end user is testing. he should be able to see it through and thorugh"
**AI Response**: Added `package.json` and `package-lock.json` so the live Playwright tests are declared and reproducible from the repository rather than resolved from a parent npm environment.
**Context**: QA execution and test-tooling integrity.
**Files**: `package.json`, `package-lock.json`, `docs/qa-test-plan.md`.
**Validation**: `npm install --package-lock-only` reported zero vulnerabilities for declared dependencies; `npm run check:js` passed; `npm run test:e2e` passed 2/2 against the public URL.
**GitHub**: Pending publication in the next commit; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## Cloud-Only Account Boundary
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "and why are we still referring to the local data? everything is cloud. the project is cloud. where the model trained. where are the model. I cannot go the homepage? if i share that link to another person, he cannot go the first time page. there is no email account assocaie? ther eis not gmail integration or any email integration. security sucks. what have you amde?"
**AI Response**: Replaced anonymous/local entry assumptions with an authenticated cloud landing page, email/password account flow, Google OAuth option, sign-out back to the root landing page, and Supabase-user-scoped persistence. Removed IndexedDB from the active runtime and removed generated learner IDs from the persistence path.
**Context**: Corrective cloud architecture implementation.
**Files**: `auth.css`, `auth.js`, `auth-runtime.js`, `cloud-client.js`, `onboarding.js`, `persistence-bridge.js`, `index.html`, `package.json`, `docs/SDD.md`, `docs/architecture.md`, `docs/cloud-deployment.md`, `docs/qa-test-plan.md`, `aidlc-docs/aidlc-state.md`.
**Decision Logic**: A public app cannot safely expose dashboard data before authentication. Supabase Auth now owns identity; Postgres RLS owns data isolation; local browser storage is not an application data path.
**Validation**: Post-edit JavaScript syntax validation passed locally. Live end-to-end auth tests require deployment of this commit and a configured Supabase email/OAuth provider.
**GitHub**: Pending publication; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## Final Seeded Data Cleanup
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "none of them are working. where are you storing the cache, like when I relaoded after your changes, my prevous logged in sessoin got out. and now I again see the some exisitng values. please delete all the exisitng values you have, anika sharma, ..... and all the metrics you have."
**AI Response**: Removed the final static recommendation and all seeded learner identity/metric defaults from the active runtime. Removed obsolete local demo launchers, updated the standard JavaScript check to include all active modules, and documented Supabase Auth session storage separately from cloud learner data.
**Context**: Final cloud-only data cleanup.
**Files**: `app.js`, `index.html`, `live-profile.js`, `README.md`, `package.json`, `docs/architecture.md`, `docs/production-readiness.md`, `project-notes.md`.
**Validation**: Repository search found no seeded names, fake dashboard metrics, localStorage, IndexedDB, or OrbitStore references in active runtime. `npm run check:js` passed. Cloud commit `f248788` pushed to `main`.
**Data Safety**: No Supabase rows were bulk-deleted because those are account-owned records and a source cleanup must not destroy real learner data. Explicit account deletion remains a separate authenticated operation.
**GitHub**: Repository `https://github.com/vikasjangra99/orbit-learning`; commit `f248788`.

---

## Seeded Data Removed
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "none of them are working. where are you storing the cache, like when I relaoded after your changes, my prevous logged in sessoin got out. and now I again see the some exisitng values. please delete all the exisitng values you have, anika sharma, ..... and all the metrics you have."
**AI Response**: Removed seeded learner profiles and fake metrics from the active JavaScript and HTML runtime, removed the local database path from the cloud app, and changed initial progress to an empty cloud state. Added dynamic profile loading from Supabase and documented that account-owned Supabase rows require a separate controlled deletion.
**Context**: Cloud data integrity and cache/reset correction.
**Files**: `app.js`, `index.html`, `live-profile.js`, `docs/qa-test-plan.md`, `project-notes.md`.
**Validation**: Repository search found no seeded names, fake metric values, localStorage, IndexedDB, or OrbitStore references in active runtime/docs; JavaScript checks passed.
**GitHub**: Pending publication; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## Cloud Account QA Passed
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "and why are we still referring to the local data? everything is cloud. the project is cloud. where the model trained. where are the model. I cannot go the homepage? if i share that link to another person, he cannot go the first time page. there is no email account assocaie? ther eis not gmail integration or any email integration. security sucks. what have you amde?"
**AI Response**: Deployed the authenticated cloud landing page and ran live end-user checks for unauthenticated entry, email/password and Google OAuth controls, and client-side account form validation. Added explicit model provenance documentation stating that no trained model exists yet.
**Context**: Cloud-only corrective release and end-user QA.
**Files**: `tests/e2e-smoke.spec.js`, `docs/ai-model.md`, `docs/SDD.md`, `docs/cloud-deployment.md`, `project-notes.md`.
**Validation**: Live Playwright account-entry suite passed 2/2 in 4.8 seconds; JavaScript checks passed; VS Code diagnostics previously reported no errors.
**Decision Logic**: The public root must show an account landing page. Learner data must not render without a Supabase session. A model is not claimed until an artifact, evaluation, and provenance record exist.
**GitHub**: Changes pending publication; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## Dynamic Cloud Profile Correction
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "good. worked. now, the app inside it is not good. so, there these buttons do no work, on the top right corner. first. second, the data is alredy filled in the portal. I see the skill signals having some values. also I selected the law and mathematics, but I dont see the smae thigs when I get in the app. so, the app has the data, already. they are all manually entered feilds. they are not dynamic wrt what we enter"
**AI Response**: Added live Supabase profile and attempt reads, derived dashboard subjects from saved domains, calculated initial skill signals from cloud attempts, removed active local runtime references, and implemented dismissible notification/help panels.
**Context**: Functional cloud-data correction.
**Decision Logic**: Hard-coded learner objects were the controlling source of the mismatch. The authenticated profile and attempts must be the source of truth after login.
**Files**: `cloud-client.js`, `auth-runtime.js`, `live-profile.js`, `ui-actions.js`, `index.html`, `docs/SDD.md`, `docs/qa-test-plan.md`, `project-notes.md`.
**Validation**: All changed JavaScript files pass syntax checks. Live deployment and authenticated profile-data tests are pending publication and test-account execution.
**GitHub**: Pending publication; repository `https://github.com/vikasjangra99/orbit-learning`.

---

## GitHub Repository Published
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "create it for me. I will give the neessary permission to you, when you ask. you the web thing"
**AI Response**: Authorized GitHub CLI, created the public repository, pushed the project, and enabled GitHub Pages using the Actions workflow.
**Context**: Cloud foundation; repository publication.
**Files**: Repository contents committed as `3634a65`; subsequent cloud documentation updates are pending commit.
**Decision Logic**: GitHub Pages is free, shareable, and suited to the dependency-free static frontend. Supabase credentials remain outside Git history and will be injected through Actions secrets.
**GitHub**: Repository `https://github.com/vikasjangra99/orbit-learning`; Pages `https://vikasjangra99.github.io/orbit-learning/`.
**Remaining Gate**: Supabase project, schema execution, anonymous auth enablement, and `SUPABASE_URL` plus `SUPABASE_ANON_KEY` repository secrets.

---

## Cloud Foundation Prepared
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "please. use everything on cloud. no local needed. Use y personal github, host it using the free things. use the free database. use everything free, it should be a real project. I should be able to share the link to anyone, and they should start using it"
**AI Response**: Selected GitHub Pages plus Supabase free-tier Auth/Postgres. Added deployment workflow, Supabase schema with row-level security, cloud client, configuration template, and cloud deployment instructions. Local IndexedDB remains only as an unconfigured preview fallback and is not the target deployment path.
**Context**: Construction; cloud foundation architecture.
**Decision Logic**: GitHub Pages provides free static hosting; Supabase provides free Postgres and Auth; RLS protects per-user rows. The workflow fails when required cloud secrets are absent so a misleading public deployment is not produced.
**Files**: `.github/workflows/deploy.yml`, `cloud-config.example.js`, `cloud-config.js`, `cloud-client.js`, `supabase/schema.sql`, `docs/cloud-deployment.md`, `docs/SDD.md`, `decisions.md`, `aidlc-docs/aidlc-state.md`, `index.html`, `persistence-bridge.js`.
**Validation**: Account check found GitHub CLI unavailable, no GitHub remote, no Supabase configuration, and no public URL. JavaScript validation is pending final post-edit check.
**GitHub**: Not available; no remote has been created.

---

## Repository Verification
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "we are done with the prototype. real project comes up now. real repository. make no mistake. recheck the project everytime you make. verify it."
**AI Response**: Rechecked the complete project after the persistence and documentation edits. Corrected README language that still described the database as excluded and added a browser-compatible ID fallback.
**Context**: Construction foundation; post-edit verification.
**Files**: `README.md`, `storage.js`.
**Validation**: All JavaScript files pass `node --check`; all local assets are wired in `index.html`; editor diagnostics report no errors; Git root remains the project directory.
**GitHub**: Not available; no remote has been created.

---

## Foundation Persistence Implemented
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "we are done with the prototype. real project comes up now. real repository. make no mistake. recheck the project everytime you make. verify it."
**AI Response**: Added an independent repository boundary, SDD and AI-SDLC records, a real IndexedDB storage module, and a persistence bridge for onboarding learners and practice attempts.
**Context**: Construction foundation; persistence slice.
**Files**: `.gitignore`, `.github/copilot-instructions.md`, `docs/SDD.md`, `docs/architecture.md`, `aidlc-docs/aidlc-state.md`, `aidlc-docs/audit.md`, `storage.js`, `persistence-bridge.js`, `index.html`, `onboarding.js`, `README.md`, `project-notes.md`, `decisions.md`.
**Decision Logic**: IndexedDB provides real local persistence without prematurely introducing authentication, cloud costs, or external data transfer. The unrelated parent Git repository was not used.
**Validation**: `node --check` passed for all changed JavaScript files; local asset references verified; Git root verified as `C:\Users\vjangra\adaptive-learning-prototype`.
**GitHub**: Not available; no remote has been created.

---

## Product Scope Confirmed
**Timestamp**: 2026-08-28T00:00:00Z
**User Input**: "do we have to create an database too. I entered as a new user I dont see that. also, lets start building the proejct, make everything yourself, whatever is needed. Just make sure you follow what we discussed about the sdd, and the audit, and the file we decided to maintain. keep everything there and makeit"
**AI Response**: Chose IndexedDB for the foundation release instead of a cloud database. This supplies real browser persistence while preserving the local-first constraint. Cloud database, authentication, and sync remain later stages.
**Context**: Requirements and architecture decision.
**Files**: `docs/SDD.md`, `aidlc-docs/aidlc-state.md`, `aidlc-docs/audit.md`.
**Validation**: Scope includes explicit persistence, profile isolation, export/import, and later security/cloud gates.
**GitHub**: Not available; no remote has been created.

---
