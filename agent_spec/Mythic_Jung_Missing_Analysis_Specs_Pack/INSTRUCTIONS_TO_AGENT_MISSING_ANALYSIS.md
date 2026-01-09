# Instructions to Agent — Adding Missing Analysis Dimensions

## Goal
Integrate four analytical lenses into the existing system WITHOUT breaking:
- output schema
- assessments
- UI structure

## Do NOT
- Add new tabs
- Change existing question IDs
- Overwrite existing content

## Do
- Add new sub-sections/cards where specified
- Extend generation logic to populate them
- Reference evidence properly

## Implementation order
1. Update generation prompts to include these lenses
2. Add fields to GeneratedOutput where needed (non-breaking)
3. Update UI to show new cards
4. Ensure evidence mappings exist
5. Test regeneration with partial assessments

## Acceptance criteria
- Each lens appears clearly in output
- Language is descriptive, not diagnostic
- Users feel *more seen*, not more analyzed
