# 03 — Synthesis Engine Spec (Self Construction)

## Objective
Combine the 6 CharacterProfiles (+ assessment answers) into a coherent **Self Model**.
This outputs a structured internal representation that the Narrative Engine will render into user-facing text.

## Inputs
- profiles[6]: CharacterProfile
- assessmentAnswers: keyed by questionId

## Output
A `SelfModel` object:
- meta: synthesisVersion, inputHash
- weights:
  - perCharacterWeight
  - perSectionAttribution (ego/persona/shadow/etc.)
- coreMappings:
  - ego, persona, shadow, shadowVirtue, feelingFunction, erosAxis
  - truthOrientation, powerStance, relationalAsymmetry, lifePhase
- tensions: polarityPairs, recurringConflicts
- costsAndCompensations: costs, compensators, avoidedMedicine
- individuationDirection: missingQualities, synthesisTrio, nextChapterTheme

## Weighting rules (deterministic + explainable)
1) Start equal across 6
2) Apply assessment overrides:
   - add delta to selected character(s) for affected mapping
   - scale delta by confidence if present
3) Normalize per mapping
4) If conflict (close weights), represent as tension (do not force choice)

## Explainability
Every mapping produces rationaleSignals for Evidence:
- matched trait signals
- characterRefs
- assessmentRefs

## Failure modes
- Overfit to one “cool” character
- Confuse persona with ego
- Make shadow always “worst”
- Ignore life phase

## API
POST /v1/synthesis -> SelfModel

## Tests
- Deterministic outputs for same inputs
- No empty mappings when signal exists
- Tension generation when weights close
