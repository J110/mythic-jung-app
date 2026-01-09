# 05 — Implementation Tickets (Agent Work Plan)

## Milestone 0 — Foundations
- [ ] Create Flutter project with flavors (dev/prod)
- [ ] Add Riverpod, go_router, dio, local storage
- [ ] Setup theme + typography + spacing scale
- [ ] Setup CI: analyze + test
- [ ] Add fixture GeneratedOutput JSON and render skeleton tabs

## Milestone 1 — Characters
- [ ] CharacterEntryScreen (6 inputs)
- [ ] Reorder characters (drag handle)
- [ ] Validate: must have 6 non-empty
- [ ] Persist locally (UserProfile)
- [ ] Trigger baseline generation -> output cache
Acceptance:
- Changing any character invalidates old answers (prompt user)

## Milestone 2 — Output Tabs
- [ ] Story tab cards + detail screens
- [ ] Identification tab cards + evidence sheet
- [ ] Functioning tab cards
- [ ] Actions tab situation cards
- [ ] Life Domains tab domain cards
Acceptance:
- Tab overview uses previews; detail page shows full text + bullet lists

## Milestone 3 — Assessments
- [ ] AssessmentHome: 7 modules with progress
- [ ] QuestionPager: one question per screen
- [ ] Character selection grid (from the 6)
- [ ] Save answers locally, sync optional
- [ ] Regenerate outputs after each answer (debounced)
Acceptance:
- Completing a module updates outputs + “Updated” badges

## Milestone 4 — Backend integration
- [ ] API client wiring
- [ ] /profile, /assessments/answer, /generate, /output
- [ ] Auth integration (guest minimal)
- [ ] Robust error states and offline fallback
Acceptance:
- App runs with backend disabled (fixtures) OR enabled (live)

## Milestone 5 — Export (optional)
- [ ] Export button in Settings
- [ ] Request export from backend; open share sheet
Acceptance:
- Generated file downloads and opens

## Milestone 6 — QA + Release
- [ ] Widget tests for all tabs
- [ ] Integration tests for assessment flow
- [ ] Sentry + analytics events
- [ ] Web deploy guide, Android/iOS release guide

