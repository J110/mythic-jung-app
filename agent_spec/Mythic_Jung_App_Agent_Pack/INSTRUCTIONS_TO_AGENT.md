# Instructions for the Agent / Dev Team

## Goal
Build a Flutter app (Android, iOS, Web) implementing the character-based Jungian experience per this pack.

## Non-negotiables
1. UI must be card-based with drilldowns. No walls of text on the first screen of a tab.
2. Outputs must be rendered from **GeneratedOutput JSON** (02_OUTPUT_SCHEMA.json). Treat it as the contract.
3. Assessment is **one page per question**, using the 6 chosen characters as selectable answers.
4. Any assessment answer change triggers regeneration and updates Evidence.
5. Offline-first: always render last cached output and last saved answers even without internet.

## Implementation constraints
- Do NOT hardcode outputs into the client. The client renders JSON.
- Do NOT embed private keys in Flutter. Use backend for generation.
- Keep prompting / generation logic server-side (preferred).
- Keep “mystical tone” in story content, but keep app UX clean and minimal.

## UX rules
- Always show “Evidence” (how derived) as a sheet/modal from any section.
- Show “Last updated” on each assessment module.
- Show “What changed” summary after regeneration (small diff note).

## Delivery checklist
- Flutter project with clean architecture, readable code, linting, and tests.
- Runs on Android, iOS, and Web.
- Documented setup steps in README.
- Environment config for dev/prod.
- Includes fixtures and mock mode.

