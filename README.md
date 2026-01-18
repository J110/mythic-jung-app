# Mythic Jung - Flutter App

A beautiful, state-of-the-art Flutter application for Jungian analysis of personal identity based on TV/movie/real characters that users connect with. The app features shadow silhouettes with peeking eyes as its signature visual style.

## Features

### ✨ Core Features
- **Character Entry**: Enter characters that resonate with you (from stories, myths, films, etc.)
- **Character Recognition**: AI-powered recognition of characters with clarification flow
- **Mythic Narrative Generation**: Automatically generates a Jungian narrative report
- **Three Narrative Tones**:
  - **Minimal**: Direct, action-oriented insights without storytelling
  - **Modern**: Contemporary narrative with your characters woven throughout (default)
  - **Mythical**: Fairy-tale style, magical but accessible language

### 📱 Output Tabs
- **Story**: Myth Summary, Central Tension, Guiding Sentence, North Star Scene, Current Chapter
- **Psyche**: Ego, Persona, Shadow, Feeling Function, Eros Axis positions with dynamic character shadows
- **Archetypes**: Your archetype constellation and shadow energies
- **Affirmations**: Life domain cards (Work, Leadership, Truth, Intimacy, Social, Inner Life)
- **Scenarios**: Real-life situation cards for self-discovery

### 🎨 Design Features
- **Shadow Silhouettes with Peeking Eyes**: Signature visual style across all cards
- **Rich Environments**: Varied backgrounds with time-of-day and weather variability
- **SVG Icons**: Detailed icon-based characters for Psyche positions
- **3-Tab Pattern**: About, In Your Life, Examples structure for all detail views
- **Dark Mode Support**: Full support for light and dark themes

### 🔧 Technical Features
- **Offline-First**: Renders cached outputs even without internet
- **Cross-Platform**: Supports Android, iOS, and Web
- **Clean Architecture**: Well-organized codebase with clear separation of concerns
- **State Management**: Riverpod for reactive state management
- **Local Storage**: Drift/SQLite for offline persistence

## Project Structure

```
lib/
  app/
    app.dart              # Main app widget
    router.dart           # Navigation configuration
    theme/                # App theming
  core/
    api/                  # API client
    config/               # App configuration (API URLs)
    models/               # Data models (GeneratedOutput, Character, etc.)
    storage/              # Local database and repositories
  features/
    onboarding/           # Welcome, Login, Character Entry, Clarification
    output_tabs/          # Story, Psyche, Archetypes, Affirmations, Scenarios
    shared/
      redesign/           # Shadow utils, painters, illustrations
```

## Getting Started

### Prerequisites
- Flutter SDK (3.10.4 or higher)
- Node.js (for backend)
- Dart SDK

### Backend Setup

1. **Navigate to backend**:
   ```bash
   cd backend
   ```

2. **Install dependencies**:
   ```bash
   npm install
   ```

3. **Set environment variables** (create `.env` file):
   ```
   OPENAI_API_KEY=your_openai_key
   PORT=3001
   ```

4. **Start the backend**:
   ```bash
   npm start
   ```
   Backend will run on `http://localhost:3001`

### Flutter App Setup

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run code generation** (for Freezed models):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run the app**:
   ```bash
   # For Web
   flutter run -d chrome
   
   # For iOS
   flutter run -d ios
   
   # For Android
   flutter run -d android
   ```

### Configuration

The app connects to the backend at `http://127.0.0.1:3001` by default. To change this:
- Edit `lib/core/config/app_config.dart`
- Or set `API_BASE_URL` environment variable when building

## Development

### Key Dependencies
- `flutter_riverpod`: State management
- `go_router`: Navigation
- `dio`: HTTP client
- `drift`: Local SQLite database
- `freezed`: Immutable data classes
- `flutter_svg`: SVG icon rendering

### Design Guide
See `UI_DESIGN_GUIDE.md` for detailed design specifications including:
- Shadow silhouette style guidelines
- Peeking eyes implementation
- Environment variability standards
- 3-tab pattern structure
- Icon allocation per page

## Production Deployment

### Backend (Render)
The backend is deployed on Render. Push to `main` branch triggers automatic deployment.

### Flutter Web (Vercel/Firebase)
Build for production:
```bash
flutter build web --release
```
Deploy the `build/web` directory.

## Usage Flow

1. **Welcome**: Select your narrative tone (Minimal/Modern/Mythical)
2. **Login**: Enter username to save your journey
3. **Characters**: Enter characters that resonate with you
4. **Clarification**: Confirm or clarify character recognition
5. **Explore**: Browse your generated narrative across all tabs

## Recent Updates

### v2.0 - UI Redesign
- Merged welcome and login into swipeable onboarding
- Simplified to 3 narrative tones
- Added Affirmations and Scenarios tabs
- Implemented shadow silhouettes with peeking eyes throughout
- Added SVG-based icons for Psyche positions
- Deduplicated icons across all pages

---

Built with ❤️ using Flutter
