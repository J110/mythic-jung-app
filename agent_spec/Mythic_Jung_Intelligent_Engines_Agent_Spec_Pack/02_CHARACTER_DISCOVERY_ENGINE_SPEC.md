# 02 — Character Discovery Engine Spec (Jungian + Narrative)

## Objective
For each recognized canonical character, compute a **Jungian narrative profile** that can be used downstream for synthesis.
This is NOT a plot summary.
It is a structured archetypal + functional map.

## Inputs
- canonicalId + metadata from recognition
- optional: portrayal/era (actor, director, season)

## Outputs
A `CharacterProfile` object (stored/cached):
- canonicalId
- name
- archetypeSignals:
  - primaryArchetypes[] (ranked)
  - secondaryArchetypes[]
  - shadowArchetypes[]
- jungFunctions:
  - egoMode (how they decide/act)
  - personaMode (public mask style)
  - shadowPattern (darker fallback)
  - feelingChannel (what softens/restores)
  - erosNeed (love/meaning axis)
  - truthOrientation (rules vs reality)
  - powerStance (authority relationship)
  - relationalPattern (mutuality/asymmetry)
- narrativeArc:
  - wound/origin (symbolic)
  - desire (what they chase)
  - fear (what they avoid)
  - trials (recurring)
  - transformation (if any)
  - redemption (what heals imbalance)
- behavioralTraits:
  - strengths[]
  - liabilities[]
  - triggers[]
  - compensations[]
- symbols:
  - motifs[]
  - coreMetaphor (one line)
- provenance:
  - sources[] (titles/episodes/books used; or KB entries)
  - generatedAt, modelVersion, profileVersion

## Discovery approach
1) Retrieve canonical facts from KB (aliases, franchise, era)
2) Pull structured lore snippets from KB or curated notes
3) Run an LLM extraction step to populate CharacterProfile (schema constrained)
4) Validate schema + sanity checks
5) Cache per (canonicalId, portrayalVariant, profileVersion)

## Jungian rubric
- Archetypes must be functional, not aesthetic.
- Separate ego competence vs persona image.
- Narrative arc must include wound → strategy → cost → redemption.

## Sanity checks
- Ensure primaryArchetypes non-empty
- strengths/liabilities >= 3 each
- wound/desire/fear filled
If missing: rerun extraction or mark profile incomplete.

## API
GET /v1/characters/{canonicalId}/profile?variant=...
POST /v1/characters/profiles/batch

## Tests
- Regression snapshots for popular characters
- Consistency across runs (tolerance limits)
- Schema validation and caching keys
