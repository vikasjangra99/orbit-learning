# AI-SDLC State

## Project

Name: Orbit Learning
Phase: Construction
Stage: Cloud foundation build
Status: In progress
Last updated: 2026-08-28

## Workflow

- [x] Workspace detection
- [x] Prototype review
- [x] Product direction and first-use journey
- [x] SDD foundation
- [x] Lightweight project records
- [x] Cloud persistence implementation
- [ ] Domain engine implementation
- [x] Tests and verification
- [ ] Build and test instructions
- [ ] Security and cloud readiness review

## Current Scope

Implement the cloud application foundation described in `docs/SDD.md`: GitHub Pages hosting, Supabase email/OAuth authentication, Supabase Postgres persistence, separated profiles through row-level security, content and attempt records, deterministic progress behavior, and deployment validation. The landing page must be the unauthenticated entry point; no learner data is shown before sign-in.

## Repository Provenance

Repository: local Git repository to be initialized in this directory.
GitHub: not created; no remote URL exists.

## Extension Configuration

Security and cloud extensions: cloud deployment is now the active target. Detailed production security review remains a gate before broad public use. External account authorization is pending: no GitHub remote or Supabase project is available yet.
