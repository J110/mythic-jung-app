# Mythic Jung - Flutter App

A beautiful, state-of-the-art Flutter application for Jungian analysis of personal identity based on TV/movie/real characters that users connect with. The app features a mindful and mythical theme with card-based UI and offline-first functionality.

## Features

### ✨ Core Features
- **Character Entry**: Enter 6 characters that resonate with you (from stories, myths, films, etc.)
- **Mythic Narrative Generation**: Automatically generates a Jungian narrative report based on selected characters
- **Assessment Modules**: Complete 7 assessment modules to refine your mythic narrative
- **Output Tabs**: Explore your myth through 5 main sections:
  - **Story**: Myth Summary, Central Tension, Guiding Sentence, North Star Scene
  - **Identification**: Ego, Persona, Shadow, Shadow Virtue, Feeling Function, Eros Axis
  - **Functioning**: Core Traits, Symbolic Essence, Narrative Arc, Redemption Arc
  - **Actions**: Situation blocks with aligned responses and guidance
  - **Life Domains**: Work, Leadership, Truth, Intimacy, Social, Inner Life

### 🎨 Design Features
- **Beautiful Mythical Theme**: Carefully crafted color palette with purple, indigo, gold, and teal accents
- **Mindful Aesthetics**: Clean, minimal UI with thoughtful spacing and typography
- **Card-Based Layout**: All content presented in beautiful, tappable cards with icons and gradients
- **Evidence System**: Transparent evidence showing which characters and assessments influenced each output
- **Dark Mode Support**: Full support for light and dark themes

### 🔧 Technical Features
- **Offline-First**: Renders cached outputs even without internet
- **Cross-Platform**: Supports Android, iOS, and Web
- **Clean Architecture**: Well-organized codebase with clear separation of concerns
- **State Management**: Riverpod for reactive state management
- **Local Storage**: Drift/SQLite for offline persistence
- **Routing**: go_router for declarative navigation

## Project Structure

```
lib/
  app/
    app.dart              # Main app widget
    router.dart           # Navigation configuration
    theme/
      app_theme.dart      # Beautiful mythical theme
  core/
    api/                  # API client (mock mode enabled)
    models/               # Data models (GeneratedOutput, Character, etc.)
    storage/              # Local database and repositories
    widgets/              # Reusable widgets (OutputCard, EvidenceSheet)
    utils/                # Utilities and constants
  features/
    onboarding/           # Welcome and character entry screens
    output_tabs/          # Story, Identification, Functioning, Actions, Life Domains
    assessment/           # Assessment modules and question pager
    settings/             # Settings screen (optional)
```

## Getting Started

### Prerequisites
- Flutter SDK (3.10.4 or higher)
- Dart SDK
- Android Studio / Xcode (for mobile builds)
- VS Code or Android Studio (for development)

### Installation

1. **Clone and navigate to the project**:
   ```bash
   cd /Users/anmolmohan/Projects/flutter_app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run code generation** (for Freezed models):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**:
   ```bash
   # For iOS
   flutter run -d ios
   
   # For Android
   flutter run -d android
   
   # For Web
   flutter run -d chrome
   ```

## Development

### Key Dependencies
- `flutter_riverpod`: State management
- `go_router`: Navigation
- `dio`: HTTP client
- `drift`: Local SQLite database
- `freezed`: Immutable data classes
- `json_serializable`: JSON serialization

### Mock Mode
The app currently runs in mock mode, using fixture data from `assets/fixtures/generated_output_fixture.json`. To enable backend integration, update the `ApiClient` in `lib/core/api/api_client.dart`.

### Architecture
- **Repositories**: Handle data persistence and API calls
- **Providers**: Riverpod providers for state management
- **Models**: Freezed data classes matching the GeneratedOutput schema
- **Widgets**: Reusable UI components with consistent styling

## Usage

1. **Onboarding**: Start by entering 6 characters that resonate with you
2. **Generate**: The app automatically generates your mythic narrative
3. **Explore**: Browse through Story, Identification, Functioning, Actions, and Life Domains tabs
4. **Assess**: Complete assessment modules to refine your narrative
5. **Evidence**: Tap "Evidence" on any card to see how outputs were derived

## Next Steps

- [ ] Backend API integration (currently using mock/fixture data)
- [ ] Export functionality (DOCX/PDF)
- [ ] User authentication
- [ ] Analytics and crash reporting (Sentry)
- [ ] Additional customization options

## License

This project is part of a private development effort.

---

Built with ❤️ using Flutter
