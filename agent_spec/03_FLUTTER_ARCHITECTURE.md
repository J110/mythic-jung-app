# 03 — Flutter Architecture (Production Plan)

## Tech stack (recommended)
- Flutter stable
- Riverpod (state management)
- go_router (routing)
- dio (HTTP)
- drift (SQLite) OR Hive (local persistence)
- Freezed + json_serializable (models)
- Firebase Analytics or PostHog (events)
- Sentry (crash)

## Folder structure
lib/
  app/
    app.dart
    router.dart
    theme/
  core/
    api/
      api_client.dart
      endpoints.dart
    models/
      character.dart
      assessment_answer.dart
      generated_output.dart
    storage/
      local_db.dart
      repositories.dart
    widgets/
      output_card.dart
      evidence_sheet.dart
      character_picker.dart
      question_pager.dart
    utils/
  features/
    onboarding/
    output_tabs/
      story/
      identification/
      functioning/
      actions/
      life_domains/
    assessment/
    settings/

## Routing (go_router)
- /welcome
- /characters
- /home (tabs)
  - /home/story
  - /home/identification
  - /home/functioning
  - /home/actions
  - /home/life-domains
  - /home/assessment
  - /home/settings

## State (Riverpod providers)
- profileProvider (UserProfile: characters, answers, output cache)
- outputProvider (GeneratedOutput + loading/error)
- assessmentProgressProvider (derived)
- apiClientProvider
- localRepoProvider

## Data flow (offline-first)
1. Load cached UserProfile from local DB.
2. When user edits characters/answers:
   - update local DB immediately
   - trigger regeneration (debounce)
3. Regeneration:
   - if backend configured: call /generate
   - else: use mock generator (dev)

## UI components
- OutputCard: title + preview + CTA
- EvidenceSheet: bottom sheet listing evidence items for a targetPath
- QuestionPager:
  - question text
  - character selection grid
  - next/back
  - progress

## Testing
- Unit: model parsing (GeneratedOutput JSON)
- Widget tests: each tab renders cards from fixture JSON
- Integration: assessment flow end-to-end

## CI (minimum)
- flutter analyze
- flutter test
- build web (optional)

