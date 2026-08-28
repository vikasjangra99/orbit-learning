# Orbit Learning
## Software Design and Product Specification

Version: 0.2.0
Status: Approved for cloud foundation build
Owner: Project team
Last updated: 2026-08-28
Repository: Independent local Git repository; GitHub remote not yet assigned.

## 1. Purpose

Orbit Learning is a personal learning web application for multiple independent learners. It asks what a learner knows, what domains they care about, and what they want to achieve. It then guides practice using learner performance, confidence, prerequisites, and review history.

The system is intentionally more than a generative AI chat interface. Generative AI may explain, coach, and draft reviewed content. The learning engine remains responsible for mastery estimation, activity selection, scheduling, and evaluation.

## 2. Current Release

Release 1 is the cloud foundation build. It converts the experience prototype into a shareable static web application backed by Supabase Auth and Postgres with row-level security.

Included:
- First-use onboarding.
- Multiple learner profiles.
- Explicit domains, goals, and learning preferences.
- Cloud persistence using Supabase Auth and Postgres.
- Curated placeholder content with version identifiers.
- Practice attempts and progress records.
- Deterministic recommendation behavior.
- Export and import of learner data.
- Responsive web experience.

Excluded from this release:
- Production identity verification and account recovery beyond Supabase anonymous auth.
- External AI provider calls.
- Production-grade account security.
- Payments, classrooms, social features, and analytics.
- Claims of educational effectiveness.

## 3. Users

The pilot includes people with different backgrounds: school students, university students, law learners, teachers, environmental educators, commerce and marketing learners, corporate professionals, programmers, and beginners.

A learner profile describes goals and context. It must not permanently label ability, infer sensitive traits, or expose one learner's history to another.

## 4. Product Requirements

### FR-ONB-001 First-use setup
A new visitor shall see a welcome page and be able to create a learner space by entering a name, choosing one or more domains, and selecting a learning intention.

Acceptance criteria:
- Setup cannot continue without a name, at least one domain, and one goal.
- The summary reflects the submitted choices.
- Completion creates a distinct learner record.
- Reloading restores the completed state without showing setup again.

### FR-PROFILE-001 Profile isolation
The system shall keep learner profiles, attempts, mastery, schedules, and preferences separate by learner ID.

Acceptance criteria:
- Switching profiles changes all learner-owned views.
- A repository operation requires a learner ID for learner-owned data.
- Export and import preserve profile boundaries.
- Deleting one profile does not delete another profile.

### FR-CONTENT-001 Content model
Each learning item shall have a stable ID, content version, domain, skill, difficulty, answer specification, explanation, and provenance status.

### FR-ADAPT-001 Adaptive practice
After an attempt, the system shall update the learner's skill state and select a next activity using performance, confidence, difficulty, prerequisites, and review state.

The first implementation may use deterministic rules. A future mastery model may use Bayesian Knowledge Tracing or another evaluated model.

### FR-ADAPT-002 Explainable recommendations
Each recommendation shall include a short reason such as due review, recent error, weak prerequisite, or ready for challenge.

### FR-DATA-001 Cloud data control
The learner shall be able to export and delete cloud data. Row-level security shall prevent one authenticated user from reading or writing another user's learner profile or attempts.

### FR-AI-001 AI boundary
The core learning loop shall operate when no AI provider is configured. No LLM shall silently determine mastery or progression.

## 5. Non-Functional Requirements

- Accessibility: keyboard-operable controls, visible focus, semantic labels, and readable contrast.
- Reliability: refresh must preserve saved learner state; malformed imports must be rejected without replacing current data.
- Privacy: collect only required learner data; learner history is sent only to the configured Supabase project.
- Reproducibility: recommendation decisions include content and model versions.
- Performance: the first screen should render without a network dependency except optional fonts.
- Maintainability: UI, persistence, and adaptive domain logic remain separate.

## 6. Architecture

The cloud foundation uses a static browser application hosted by GitHub Pages, Supabase anonymous authentication, and Supabase Postgres. The boundaries are:

- Presentation: HTML/CSS and interaction controllers.
- Domain: learner profiles, content, attempts, mastery, scheduling, and recommendation rules.
- Persistence: Supabase client with authenticated-user scoping and Postgres row-level security.
- Integration boundary: an optional future AI service interface, disabled in this release.
- Documentation: `docs/` describes the product; `aidlc-docs/` records execution and audit history.

## 7. Data Model

Learner: id, displayName, domains, goal, preferences, createdAt, updatedAt. The ID is the Supabase Auth user ID.

Learning item: id, version, domain, skill, prompt, answer, explanation, difficulty, prerequisites, provenance.

Attempt: id, learnerId, itemId, itemVersion, correctness, confidence, hintUsed, responseTimeMs, createdAt.

Skill state: learnerId, skillId, masteryEstimate, uncertainty, lastAttemptAt, nextReviewAt, modelVersion.

All timestamps are ISO 8601 UTC strings. IDs are generated locally and are not treated as authentication credentials.

## 8. AI And Safety Boundaries

- Generated explanations are optional and clearly identified.
- Generated content requires schema validation and human review before publication.
- Learner data is not used to train a model in this release.
- The system does not infer emotion, learning style, medical status, or protected characteristics.
- Educational guidance is not professional legal, medical, financial, or safety advice.

## 9. Evaluation

Before product claims, compare deterministic recommendations with random and fixed progression using synthetic traces. During the pilot, measure immediate accuracy, delayed retention, repeated errors, hint dependence, confidence calibration, and whether learners understand recommendation reasons.

Practice questions and evaluation questions must remain separate.

## 10. Traceability And Change Control

Every meaningful change must identify the relevant requirement ID, record why the change was made, list files changed, record validation performed, and state Git/GitHub provenance. No GitHub URL may be invented. If a repository, commit, issue, or pull request does not exist, the record must say so.

Product decisions live in `decisions.md`; the readable project overview lives in `project-notes.md`; detailed workflow activity lives in `aidlc-docs/audit.md`; exact code history lives in Git.

## 11. Definition Of Done For Foundation Build

- A new visitor can complete onboarding.
- A returning visitor can resume without losing state.
- At least two profiles can coexist without data mixing.
- Practice attempts are persisted and visible in progress.
- Export/import and profile deletion work.
- Core tests cover repository isolation and recommendation behavior.
- JavaScript syntax and automated checks pass.
- Project notes, decisions, SDD, state, and audit are updated in the same change.
