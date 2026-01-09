# Mythic Jung App — Agent Pack
Date: 2026-01-07

This zip contains production-ready specs and contracts to build a Flutter app (Android + iOS + Web) for a character-based Jungian assessment experience.

## What to build (one sentence)
A Flutter app where users enter 6 characters, immediately see generated outputs in 5 tabs (Story, Identification, Functioning, Actions, Life Domains), and can refine outputs via a 7-module Assessment flow (one page per question).

## How to use this pack
1. Read **01_PRD.md** (product requirements + UX).
2. Implement the **output JSON contract** from **02_OUTPUT_SCHEMA.json**.
3. Build Flutter app per **03_FLUTTER_ARCHITECTURE.md**.
4. Implement backend per **04_BACKEND_SPEC.md** (or adapt to your stack).
5. Use **05_TICKETS.md** as the work plan.

## Deliverables expected from the agent
- Flutter app (Android/iOS/Web) with working flows and clean UI
- Backend (or mocked service) returning GeneratedOutput JSON
- Secure storage for user profile + answers
- Export (optional) to DOCX/PDF
- CI, basic tests, and deployment instructions

## Assumptions (defaults)
- State management: Riverpod
- Routing: go_router
- Networking: dio
- Local DB: drift (SQLite) OR Hive
- Auth: optional (Guest mode supported)
- Backend: Supabase OR custom API (FastAPI/Node)

