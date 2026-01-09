# 01 — PRD (Product Requirements Document)

## 1) Summary
Build a cross-platform app (Android/iOS/Web) in Flutter that generates a mythic + Jungian narrative report from user-selected characters and guided assessments. The experience must feel mystical and story-driven, while earning trust through transparent “evidence” explaining how outputs were derived.

## 2) Core Loop
1. User enters **6 characters** (free text + optional suggestions).
2. App immediately generates outputs and shows tabs:
   - Story
   - Identification
   - Functioning
   - Actions
   - Life Domains
3. User optionally completes the **Assessment** tab:
   - 7 modules
   - one page per question
   - each answer triggers output regeneration and highlights “what changed”.

## 3) Primary Screens
### A. Onboarding / Start
- Welcome (disclaimer: reflective, not medical)
- Character entry (6 inputs)
- Generate button (or auto-generate after 6 inputs)
- “Creating your myth…” loading state

### B. Main Tabs
**Tabs** (bottom nav on mobile; rail on web/tablet):
- Story
- Identification
- Functioning
- Actions
- Life Domains
- Assessment
- Settings/Profile (optional)

### C. Tab Structure (Card Grid)
Each tab is composed of cards. Tapping a card opens a detail screen/modal.
All cards should support:
- Title
- 1–2 line preview
- “Evidence” link (where applicable)
- Share/Copy (optional)

#### Story Tab Cards
- Myth Summary (long)
- Central Tension
- Guiding Sentence
- (Optional) Mythic “North Star” Scene

#### Identification Tab Cards
- Ego
- Persona
- Shadow
- Shadow Virtue
- Feeling Function (Anima/Animus)
- Eros / Intimacy Axis (if present)
- Evidence (explicit)

#### Functioning Tab Cards
- Core Traits
- Symbolic Essence
- Narrative Arc
- Redemption Arc
- Costs & Compensations (map)
- Alignment Indicators (aligned vs unaligned signals)

#### Actions Tab Cards
- Situation blocks (each is a card):
  - Situation
  - Aligned Response
  - Be Wary Of
- Guiding Question

#### Life Domains Tab Cards
- Work & Purpose
- Leadership & Authority
- Truth, Rules & Moral Courage
- Relationships & Intimacy
- Friendships & Social Life
- Emotional & Inner Life

### D. Assessment Tab
- 7 modules with progress indicator and “last updated” timestamp
- Each module opens a flow:
  - one question per page
  - answer is a character selection (single or multi)
  - optional confidence slider (0–100; default hidden)
- After each answer:
  - save locally
  - sync backend if enabled
  - regenerate outputs (debounced)

## 4) UX Requirements
### A. Trust
- Every tab includes an “Evidence” card listing:
  - Which characters influenced each output
  - Which assessment answers influenced it (question IDs)
- Show prompt/version metadata in Settings only (advanced)

### B. Simplicity
- No long walls of text on the overview page
- Use expandable sections and “Read more”
- Keep one action per screen

### C. Mystical feel without being vague
- Mythic language in Story and a “sacred tone” in headers
- Concrete situational guidance in Actions & Life Domains

## 5) Functional Requirements
- Offline-first: app should render last cached outputs
- Regenerate outputs when:
  - characters changed
  - any assessment answer changes
- Export:
  - shareable DOCX/PDF (optional, v1.1)
- Data controls:
  - clear data, delete profile, export data JSON (optional)

## 6) Non-Functional Requirements
- Performance: tab switch <100ms after first render
- Accessibility: readable fonts, large touch targets, screen-reader labels
- Privacy: no public profile; treat as sensitive reflective content
- Security: protect API keys (no secrets in client)

## 7) Acceptance Criteria (MVP)
- User can enter 6 characters
- App renders 5 output tabs from GeneratedOutput JSON
- Assessment tab works (one question per page)
- Changing an answer regenerates outputs and updates Evidence
- Works on Android, iOS, and Web

