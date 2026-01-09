# 04 — Backend Spec (API + Storage)

## Overview
Backend stores user profiles (6 characters), assessment answers, and returns a structured GeneratedOutput JSON compatible with 02_OUTPUT_SCHEMA.json.
You may implement using Supabase, FastAPI, Node, Firebase Functions, etc.

## Auth
- MVP: Guest (anonymous) + optional email/Google/Apple.
- API should accept a bearer token if using auth.
- If guest-only, use deviceId + signed session token.

## Entities (tables)
### users
- id (uuid, pk)
- created_at

### profiles
- id (uuid, pk)
- user_id (fk users.id)
- characters_json (jsonb)  // array of 6 Character objects
- schema_version (int)
- updated_at

### assessment_answers
- id (uuid, pk)
- user_id (fk users.id)
- assessment_type (text)
- question_id (text)
- selected_character_ids (jsonb array)
- confidence (int, nullable)
- updated_at

### generated_outputs (cache)
- id (uuid, pk)
- user_id (fk users.id)
- output_json (jsonb)      // GeneratedOutput
- prompt_version (text)
- model_version (text)
- schema_version (int)
- generated_at (timestamp)

## Endpoints
### POST /v1/profile
Body:
{
  "characters": [
    {"id":"...","displayName":"Ethan Hunt (McQuarrie era)","canonHint":"McQuarrie"},
    ...
  ]
}
Response: { "ok": true }

### POST /v1/assessments/answer
Body:
{
  "assessmentType": "EGO_POSITION",
  "questionId": "EGO_Q1_POINT_OF_VIEW",
  "selectedCharacterIds": ["char-1"]
}
Response: { "ok": true }

### POST /v1/generate
Body:
{
  "force": false
}
Response: GeneratedOutput (per schema)

Rules:
- If no answers, generate baseline output from characters only.
- If answers exist, weight output sections accordingly.
- Always return evidence array entries mapping targetPath -> characterRefs + assessmentRefs.
- Cache output_json; return cached if not force and unchanged.

### GET /v1/output
Response: GeneratedOutput (cached) or 404 if none.

### POST /v1/export/docx (optional)
Returns a signed URL to download a generated DOCX/PDF.

## Generation service (LLM)
Input:
- characters (names + hints)
- assessment answers keyed by assessmentType/questionId
Output:
- GeneratedOutput JSON structured per schema
- Ensure outputs are safe and non-clinical

## Observability / Limits
- Rate limit /generate per user (e.g., 10/hour)
- Log promptVersion/modelVersion per generation
- Store minimal personal data

