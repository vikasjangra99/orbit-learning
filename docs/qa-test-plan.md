# Orbit Learning QA Test Plan

Version: 0.1.0
Status: Draft for cloud foundation
Last updated: 2026-08-28
Application: https://vikasjangra99.github.io/orbit-learning/
Repository: https://github.com/vikasjangra99/orbit-learning

## 1. QA Position

A successful GitHub Actions run proves that GitHub accepted and published an artifact. It does not prove that the artifact is functionally correct, that Supabase accepts writes, that row-level security prevents cross-user access, or that a learner can complete the main journey. Tests below separate build, deployment, application, data, security, accessibility, and operational evidence.

## 2. Environments

- Local: opened from the repository for quick static checks.
- Preview: GitHub Pages deployment from a controlled branch if configured.
- Production-like: the public Pages URL using the production Supabase project.
- Supabase: project `hhomwlrsrvdleiowkrmb`, free tier, schema from `supabase/schema.sql`.
- Browsers: current Chrome, Edge, Firefox, and Safari where available; desktop and mobile viewport sizes.

Do not use real sensitive learner data in test cases. Use synthetic names and test accounts.

## 3. Test Data

- New learner A: `QA Learner Alpha`, domains Mathematics and English, goal Build a foundation.
- New learner B: `QA Learner Beta`, domain Programming, goal Go deeper.
- Existing learner: a profile with at least three completed attempts.
- Invalid import: malformed JSON, wrong schema version, missing learners array, and attempts for an unknown learner.
- Boundary values: empty name, 80-character name, 81-character name, no domains, all domains, and repeated clicks.

## 4. Release Gates

A release is blocked when any of these fail:

- R-001 Source is clean, reviewed, and traceable to a requirement.
- R-002 Every changed JavaScript file passes syntax validation.
- R-003 GitHub Actions completes successfully for the intended commit.
- R-004 The deployed URL serves the intended commit's artifact.
- R-005 Supabase schema is applied without errors.
- R-006 Anonymous authentication or the chosen sign-in path works.
- R-007 RLS blocks cross-user reads and writes.
- R-008 A learner can onboard, practice, refresh, and see persisted state.
- R-009 No secret or service-role key appears in source, artifacts, logs, or browser code.
- R-010 No known severity 1 or severity 2 defect remains without an approved exception.

## 5. Pre-Deployment Source And CI Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| CI-001 | Repository boundary | Run `git rev-parse --show-toplevel`; inspect status. | Root is the Orbit repository; unrelated user files are absent; working tree is understood. |
| CI-002 | Requirement traceability | Identify requirement IDs for the change; inspect SDD, decision log, and project notes. | Change has a reason, acceptance criteria, and documented decision where needed. |
| CI-003 | JavaScript syntax | Run `node --check` for every `*.js` file. | All files pass with exit code zero. |
| CI-004 | Asset references | Parse `index.html` references and confirm each local script and stylesheet exists. | No missing local assets. |
| CI-005 | Secret scan | Scan tracked files for service-role keys, secret keys, tokens, passwords, private keys, and accidental `.env` files. | No secret material is tracked. Public browser keys are reviewed and explicitly allowed. |
| CI-006 | SQL review | Parse/review `supabase/schema.sql`; run it in a disposable Supabase project where possible. | SQL executes cleanly and is idempotent when rerun. |
| CI-007 | Workflow review | Inspect `.github/workflows/deploy.yml`. | Workflow uses least permissions needed, requires both cloud secrets, and does not echo secrets. |
| CI-008 | Commit provenance | Record commit SHA, branch, changed files, tests, and GitHub URLs. | Audit entry is complete and does not invent missing artifacts. |
| CI-009 | Documentation consistency | Compare README, SDD, cloud deployment guide, state, audit, and decisions. | No document claims local-only behavior while deployment is cloud-first; deferred gates are explicit. |

## 6. Deployment And Hosting Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| DEP-001 | Push trigger | Push a reviewed commit to `main`. | Exactly the expected deployment workflow starts for that SHA. |
| DEP-002 | Manual trigger | Run workflow dispatch on `main`. | Workflow starts and publishes only when required secrets exist. |
| DEP-003 | Missing URL secret | Run in a disposable repository/environment without `SUPABASE_URL`. | Workflow fails before artifact publication; no misleading live build is reported. |
| DEP-004 | Missing key secret | Run without `SUPABASE_ANON_KEY`. | Workflow fails before artifact publication; secret is not printed. |
| DEP-005 | Successful deployment | Run with valid public Supabase configuration. | Checkout, config generation, artifact upload, and Pages deployment all succeed. |
| DEP-006 | URL reachability | Request the Pages URL over HTTPS. | HTTP success, valid HTML, no certificate warning, expected title and welcome content. |
| DEP-007 | Cache correctness | Deploy a visible marker in a controlled test build; open with a new session and hard reload. | Current commit content appears; stale content is not served indefinitely. |
| DEP-008 | Static asset loading | Inspect browser network requests for HTML, CSS, JavaScript, fonts, and CDN dependency. | Required assets load; failures are visible and do not silently break the app. |
| DEP-009 | Direct navigation | Open the Pages URL in a new browser and refresh at each supported view. | App does not produce a broken route or blank page. |
| DEP-010 | Rollback | Publish a known-good commit after a controlled bad build. | Known-good build can be restored and its SHA is recorded. |

## 7. First-Use And Learner Workflow Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| E2E-001 | First visit | Open the public URL in a clean browser profile. | Welcome page appears before the dashboard. |
| E2E-002 | Welcome action | Click Create your learning space. | Setup dialog opens and focus is placed in the name field. |
| E2E-003 | Name validation | Try Continue with empty name, whitespace, minimum valid name, and maximum valid name. | Empty/whitespace is blocked; valid name proceeds; bounds behave as specified. |
| E2E-004 | Domain selection | Select Mathematics and Law; remove Law; select it again. | Multi-select state is accurate and reversible. |
| E2E-005 | Goal selection | Select each goal one at a time. | Only the selected goal is active and Continue enables. |
| E2E-006 | Back navigation | Move through setup, then go Back at every step. | Previous values remain; no duplicate controls or lost selections appear. |
| E2E-007 | Setup summary | Complete setup with synthetic data. | Summary contains the submitted name, domains, and goal. |
| E2E-008 | Dashboard handoff | Enter the learning space. | Greeting, goal, recommended thread, and profile context match setup. |
| E2E-009 | Returning visit | Refresh and reopen in the same browser. | User resumes the learning space; no duplicate learner is created. |
| E2E-010 | Separate browser user | Open a clean browser profile and complete setup as learner B. | Learner B receives independent setup and data; learner A is not exposed. |
| E2E-011 | Profile switching | Switch among seeded profiles. | Name, goal, subjects, progress, and insight change together; no mixed data. |
| E2E-012 | Interest filtering | Change interests in Profile and open Learn. | Library reflects selected interests; empty selection is prevented or handled clearly. |
| E2E-013 | Study start | Click Start session. | Modal opens, question count and progress are correct, and focus is usable. |
| E2E-014 | Answer correctness | Select correct and incorrect options across questions. | Answer locks after check; feedback and explanation match the selected result. |
| E2E-015 | Hint behavior | Request a hint before answering and after selecting an answer. | Hint appears without changing correctness or bypassing answer validation. |
| E2E-016 | Session completion | Complete all questions. | Session closes or transitions cleanly; daily progress updates once. |
| E2E-017 | Refresh after practice | Complete an attempt, refresh, and return to Progress. | Saved attempt and updated progress remain available. |
| E2E-018 | Error recovery | Disconnect network during a write, then reconnect and retry. | User receives a clear state; no duplicate or silently lost attempt is created. |

## 8. Supabase Database And RLS Tests

Run these with two separate test identities and inspect the database after each case.

| ID | Test | Steps | Expected result |
|---|---|---|---|
| DB-001 | Schema creation | Run `supabase/schema.sql` in the project. | Tables, columns, constraints, indexes, and policies are created without error. |
| DB-002 | Schema repeatability | Run the schema a second time. | No destructive reset and no duplicate-object failure. |
| DB-003 | Auth availability | Create a fresh browser identity and complete onboarding. | Auth session is created through the configured provider. |
| DB-004 | Own profile insert | Complete setup as learner A. | Exactly one profile row exists for A; display name and preferences are correct. |
| DB-005 | Own profile read | Reload as learner A. | A can read only A's profile. |
| DB-006 | Own profile update | Change A's profile preference. | Update succeeds and updated timestamp changes. |
| DB-007 | Own attempt insert | Answer a question as A. | Attempt row is linked to A and includes item/version metadata. |
| DB-008 | Cross-profile read | Authenticate as B and query A's profile and attempts. | Query returns no A data or is denied by RLS. |
| DB-009 | Cross-profile insert | Authenticate as B and try to insert an attempt with A's learner ID. | Insert is denied by RLS. |
| DB-010 | Cross-profile update/delete | As B, try to update or delete A's records. | Operation is denied or affects zero rows. |
| DB-011 | Cascade deletion | Delete A's profile through the approved product path. | A's attempts are deleted by cascade; B's data remains. |
| DB-012 | Constraint validation | Insert invalid display name, confidence, negative response time, or missing required fields. | Database rejects invalid data. |
| DB-013 | Anonymous abuse boundary | Create many anonymous identities in a controlled test. | Rate limits and abuse controls are documented; no assumption of anonymity as identity proof. |
| DB-014 | Key privilege check | Inspect client and network configuration. | Only publishable key is used; service-role/secret key is absent. |

## 9. Data Control And Recovery Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| DATA-001 | Export | Request export as A. | Export contains only A's allowed learner data and attempts, with schema version. |
| DATA-002 | Import valid | Import a valid export into a test identity. | Records are restored without crossing user boundaries. |
| DATA-003 | Import malformed | Import malformed JSON and wrong schema versions. | Import is rejected; existing data remains unchanged. |
| DATA-004 | Delete account data | Use the product deletion path. | Profile and dependent attempts are deleted; confirmation is clear. |
| DATA-005 | Duplicate submission | Double-click answer/check controls or replay a request. | At most one logical attempt is recorded for one answer action. |
| DATA-006 | Clock and timezone | Use different device timezones and a daylight-saving boundary. | Timestamps remain UTC and review dates are consistent. |
| DATA-007 | Backup expectation | Review Supabase free-tier backup and recovery capabilities. | Limitation is documented; production backup expectation is not overstated. |

## 10. Security And Privacy Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| SEC-001 | XSS in display name | Enter markup/script-like strings as a name and domain context. | Text is rendered as text; no script executes. |
| SEC-002 | XSS in content | Add a malicious-looking placeholder item in a controlled branch. | Content is escaped or sanitized before rendering. |
| SEC-003 | Prompt/data boundary | Confirm no learner history is sent to an AI service in this release. | Network inspection shows no unapproved external learner-data transfer. |
| SEC-004 | Secret exposure | Inspect GitHub source, workflow logs, built artifact, and browser globals. | No secret/service-role credential appears; publishable key only. |
| SEC-005 | RLS enforcement | Execute DB-008 through DB-010. | Cross-user access is blocked. |
| SEC-006 | Transport security | Open HTTP and HTTPS variants. | HTTP redirects or is rejected; production data uses HTTPS. |
| SEC-007 | Dependency integrity | Review CDN dependency version and integrity strategy. | Dependency is pinned or its risk is documented; upgrade process exists. |
| SEC-008 | Headers and framing | Inspect response headers. | CSP, frame policy, referrer policy, and other Pages-compatible controls are assessed; gaps are recorded. |
| SEC-009 | Abuse and cost | Submit rapid requests and large input values. | Limits and cost exposure are known; no unbounded paid service is invoked. |
| SEC-010 | Privacy notice | Review onboarding and profile data messaging. | User understands what data is collected, where it is stored, and how to delete it. |

## 11. Accessibility And UX Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| A11Y-001 | Keyboard journey | Complete welcome, setup, navigation, and study using only keyboard. | Logical focus order, visible focus, and no keyboard traps. |
| A11Y-002 | Screen reader labels | Inspect buttons, dialogs, progress indicators, and profile switcher. | Controls have meaningful names and dialog state is announced. |
| A11Y-003 | Contrast | Run automated and manual contrast checks. | Text and controls meet the chosen WCAG target; failures are logged. |
| A11Y-004 | Reduced motion | Enable reduced-motion preference. | Nonessential animation is reduced or removed. |
| A11Y-005 | Zoom | Test 200% browser zoom. | No essential content or controls become inaccessible. |
| A11Y-006 | Mobile viewport | Test 320px, 375px, 768px, and desktop widths. | No clipping, overlap, horizontal scroll, or unusable controls. |
| A11Y-007 | Error clarity | Trigger validation and network errors. | Error messages identify the problem and the next action. |
| A11Y-008 | Cognitive load | Ask pilot users to identify what to do next without guidance. | Primary action and recommendation reason are understood. |

## 12. Performance And Reliability Tests

| ID | Test | Steps | Expected result |
|---|---|---|---|
| PERF-001 | Cold load | Load in a clean browser with cache disabled. | First useful content appears within the agreed budget. |
| PERF-002 | Offline shell | Load once, then disable network and refresh. | Behavior matches the declared offline capability; no false cloud-save claim. |
| PERF-003 | Slow network | Throttle to slow 3G and complete onboarding. | Loading and failure states are usable; controls do not duplicate. |
| PERF-004 | Storage failure | Block IndexedDB or cloud requests. | App shows a clear persistence-unavailable state. |
| PERF-005 | Repeated sessions | Run 50 synthetic attempts for one test identity. | No UI degradation, duplicate listeners, or runaway records. |
| PERF-006 | Concurrent sessions | Use the same identity in two tabs and submit answers. | Conflict behavior is deterministic and documented. |
| PERF-007 | Browser compatibility | Run smoke flow in supported browsers. | No critical functionality differs unexpectedly. |

## 13. Post-Deployment Monitoring

For the foundation release, monitor manually after each deployment:

- GitHub Actions result and commit SHA.
- Pages HTTP response and browser console errors.
- Supabase Auth sign-in failures.
- Supabase database errors and rejected RLS operations.
- Unexpected growth in anonymous users or attempts.
- Free-tier quota usage.
- User-reported onboarding and persistence failures.

Do not log answer content or learner identity unnecessarily. Retain only the minimum operational data needed to diagnose failures.

## 14. Defect Severity

- Severity 1: data exposure, service-role key exposure, destructive data loss, or public site unavailable.
- Severity 2: onboarding blocked, cloud writes silently lost, RLS bypass, or core study flow unusable.
- Severity 3: important workflow degradation with workaround.
- Severity 4: cosmetic, copy, or low-impact accessibility issue.

Severity 1 and 2 defects block release. Every accepted exception requires an owner, rationale, expiry/review date, and audit entry.

## 15. Current Verification Record

Verified on 2026-08-28:

- Latest three GitHub Actions deployments completed successfully.
- Public Pages URL returned the Orbit welcome page and dashboard content.
- Local repository is synchronized with `origin/main`.
- All JavaScript files pass syntax checks.
- VS Code diagnostics report no errors.
- Deployed cloud configuration contains the configured Supabase project URL.

Not independently verified from the public URL:

- Supabase schema execution.
- Anonymous sign-in enablement.
- Successful authenticated profile and attempt writes.
- Cross-user RLS behavior.
- Export and deletion behavior against cloud data.
