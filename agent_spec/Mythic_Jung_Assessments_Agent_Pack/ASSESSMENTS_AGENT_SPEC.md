# Mythic Jung App — Assessments Agent Spec (Canonical + Production)
Date: 2026-01-07

## Purpose
The Assessment system is the updater engine of the app:
- Users enter 6 characters → baseline outputs are generated.
- Assessment answers refine outputs via structured signals (character selections per question).

The system must be:
- Simple (no ambiguous wording)
- Deep (each question targets one psychological signal)
- Versioned (stable question IDs)
- Machine-readable (client + backend share the canonical question file)

## Canonical modules
1) Libidinal Charge
2) Ego Position
3) Persona Formation
4) Shadow Proximity
5) Feeling Function (Anima/Animus) + Eros
6) Cost & Compensation
7) Individuation Direction

## UX requirements
- Assessment Home: 7 tiles showing progress and last updated.
- Question flow: one page per question.
- Answers: choose only from the user’s 6 characters.
- Answer types:
  - SINGLE: exactly 1 selection
  - MULTI: up to maxSelections (used for synthesis)

## Persistence + regen
- Save locally immediately.
- Sync to backend when online.
- Trigger output regeneration after each answer change (debounce ~800ms).
- After regeneration, show “Updated” badge on tabs impacted by that answer.

## Source of truth
Use `ASSESSMENT_QUESTIONS_CANONICAL.json` as the single source for:
- question text
- questionId
- answer rules
- influences (which output areas should update)

## Evidence requirements
Backend must include evidence items referencing questionIds in `assessmentRefs`.
Minimum coverage:
- story
- identification (ego/persona/shadow/shadowVirtue/feeling/eros)
- lifeDomains (each domain)

## Versioning rules
- Minor wording change: keep questionId.
- Meaning change: create new questionId and optionally deprecate the old one.

## Acceptance criteria
- All 7 modules and their questions render from canonical JSON.
- Selection rules enforced correctly.
- Answers persist and rehydrate.
- Output regenerates when answers change.
- Evidence references the questionIds that influenced outputs.

