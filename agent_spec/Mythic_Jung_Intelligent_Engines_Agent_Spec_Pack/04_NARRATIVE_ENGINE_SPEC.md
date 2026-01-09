# 04 — Narrative Engine Spec (Dynamic Output Generation)

## Objective
Render SelfModel into user-facing content:
- Story, Identification, Functioning, Actions, Life Domains, Evidence
No hardcoding. Everything is generated from SelfModel + CharacterProfiles.

## Inputs
- SelfModel
- CharacterProfiles
- OutputSchema version

## Output
- Schema-valid `GeneratedOutput` JSON

## Engine design
Two-pass generation:
A) Outline builder (deterministic from SelfModel)
- key themes per section
- character supports
- evidence hooks

B) Text renderer (LLM structured output)
- Provide outline + constraints
- Generate JSON per schema
- Validate + repair loop

## Section constraints
### Story
- mythSummary: 3–6 paragraphs, mythic voice
- centralTension: 1–3 sentences (polarity + cost)
- guidingSentence: 1 line
- northStarScene: concrete image (optional)

### Identification
- ego/persona/shadow/shadowVirtue/feelingFunction/erosAxis required
- plus: truthOrientation/powerStance/relationalAsymmetry/lifePhase if enabled
- Each block: title + summary (3–6 sentences) + details (longer)

### Functioning
- coreTraits: 6–12 observable items
- symbolicEssence: 3–6 sentences
- narrativeFunction: 1–2 paragraphs
- narrativeArc: 1–3 paragraphs
- shadowTraits: list
- redemptionArc: 1–3 paragraphs
- costsAndCompensations: explicit
- alignmentIndicators: aligned vs unaligned lists

### Actions
- 4–8 situationBlocks
- Each: Situation + Aligned Responses (4–8) + Be Wary Of (4–8)
- Must include scenarios spanning:
  - work/power
  - intimacy/commitment
  - family crisis
  - moral conflict

### Life Domains
For each domain:
- strengths, pitfalls, growth moves (3–6 each)
- 2–4 mini-scenarios with aligned vs avoid

### Evidence
- Evidence item per major block + per life domain
- Must reference characterRefs + assessmentRefs

## Anti-generic constraints
- At least 6 motif/arc references (not name spam)
- Avoid “balance/integration” unless tied to a named tension
- Avoid adjective-only lists

## Safety
- No diagnosis language
- No self-harm encouragement
- No hate/harassment
- No explicit sexual content

## Caching
- Cache at SelfModel and GeneratedOutput level by inputHash

## Tests
- Schema validation tests
- Snapshot tests on known sets
- Heuristic: minimum lengths + evidence coverage
