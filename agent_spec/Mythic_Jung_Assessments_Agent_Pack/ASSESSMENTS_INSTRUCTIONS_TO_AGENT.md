# Instructions to the Agent — Updating the Assessment System

## Your task
Implement or update the Assessment feature exactly as defined by:
- ASSESSMENT_QUESTIONS_CANONICAL.json
- ASSESSMENTS_AGENT_SPEC.md

## Non-negotiables
1) Do NOT rewrite or invent question text.
2) Do NOT change question IDs.
3) One question per screen.
4) Choices limited to the user’s 6 characters.
5) Enforce answer rules (SINGLE vs MULTI).
6) Store answers keyed by questionId.
7) Debounced regeneration after answer changes.
8) Evidence must reference questionIds in generated outputs.

## Flutter implementation checklist
- Render assessment tiles and question flows from canonical JSON.
- Question screen includes:
  - question text
  - helper line
  - character selection UI
  - progress indicator
  - next/back
- Save answers locally and (optionally) via backend upsert.
- Trigger /generate after save (debounced) and refresh cached output.

## Backend implementation checklist
- Validate:
  - question exists
  - selection count matches answerType/maxSelections
  - selectedCharacterIds exist in profile
- Use answers in generation prompt.
- Populate evidence with assessmentRefs = [questionId].

## Testing
- Ensure the number of rendered questions exactly matches canonical JSON.
- Validate selection rules.
- Validate regen + evidence updates.

