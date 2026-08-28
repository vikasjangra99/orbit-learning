# Decision Log

## D-001: Build a visual prototype first

Date: 2026-08-28
Status: Accepted

Decision: Begin with a dependency-free visual web prototype using mock data.

Why: We need to validate the experience with several different people before investing in a dataset, adaptive model, cloud services, or AI API.

Impact: The current progress and recommendations are illustrative and must not be described as real learning intelligence.

## D-002: Web first

Date: 2026-08-28
Status: Accepted

Decision: Use a responsive web app as the first product surface.

Why: It can be shared immediately, works on laptop and phone screens, and avoids app-store distribution while the concept is being tested.

Alternatives considered: Native mobile app and desktop app.

## D-003: Multiple profiles from the beginning

Date: 2026-08-28
Status: Accepted

Decision: Show separate learner profiles in the prototype.

Why: The pilot group has different ages, subjects, goals, and technical backgrounds. A shared generic experience would hide the central product challenge.

## D-004: Lightweight records during discovery

Date: 2026-08-28
Status: Accepted

Decision: Maintain `project-notes.md` and `decisions.md` during the visual prototype phase.

Why: These capture what was made and why without creating a heavy process log before implementation has started. Detailed AI-SDLC audit, security, cloud, and provenance records will be introduced when real implementation begins.

## D-005: Independent repository boundary

Date: 2026-08-28
Status: Accepted

Decision: Initialize Git in the Orbit Learning project directory.

Why: The parent user directory is associated with an unrelated repository and contains unrelated files. The learning project needs an auditable history with no accidental coupling to personal or other project files.

Impact: The repository currently has no GitHub remote. A remote URL will be recorded only after the user creates or provides one.

## D-006: Cloud-first public deployment

Date: 2026-08-28
Status: Accepted

Decision: Use GitHub Pages for the public frontend and Supabase free-tier Auth/Postgres for cloud persistence.

Why: The project must be shareable by URL, avoid local storage, and remain within free-tier services during validation.

Security constraint: Supabase row-level security is mandatory. GitHub Actions injects only `SUPABASE_URL` and `SUPABASE_ANON_KEY`; a service-role key is prohibited from frontend code and repository history.

Impact: GitHub and Supabase account setup is required before deployment. No public URL exists until those external actions are completed.
