# Instructions to Agent — Intelligent Population (No Hardcoding)

## Goal
Implement four engines end-to-end:
1) Recognize characters confidently (with disambiguation / rejection)
2) Discover Jungian CharacterProfiles for recognized characters
3) Synthesize a deterministic SelfModel (explainable)
4) Generate dynamic narrative output as schema-valid JSON

## Do NOT
- Generate analysis for unrecognized characters
- Hardcode any narrative text
- Rewrite assessment questions

## Build order
1) Character KB + indices (lexical + embeddings)
2) /characters/recognize endpoint + UI disambiguation flow
3) CharacterProfile extraction + caching
4) SelfModel synthesis + weighting rules
5) Narrative generation + validation/repair + evidence
6) Integrate with Flutter rendering from JSON
7) Add tests, logging, metrics

## UI flow
- User enters 6 → recognize
- If ambiguous: show candidate picker (1–2 prompts max)
- If not recognized: ask for specificity (movie/show/actor/era)
- When all 6 recognized:
  - batch profiles
  - synthesize SelfModel
  - generate output
  - show tabs

## Backend
- Keys server-side only
- Store canonical IDs, answers, cached outputs
- Evidence must reference characters + questionIds

## QA acceptance
- Misspellings handled
- Junk rejected gracefully
- Outputs remain non-generic across users
- Evidence present for major sections
