# Mythic Jung

A Flutter application that helps users discover their psychological archetypes through character resonance analysis, powered by AI and Jungian psychology.

## Features

- 🎭 **Character-based Analysis**: Select fictional characters that resonate with you
- 🧠 **Archetype Identification**: Discover your dominant Jungian archetypes
- 📖 **Personalized Narratives**: Receive AI-generated psychological stories
- 💑 **Relationship Insights**: Explore dynamics with important people
- 🎨 **Beautiful UI**: Shadow-based illustrations with immersive themes

## Project Structure

```
flutter_app/
├── lib/                    # Flutter app source code
│   ├── core/               # Core functionality
│   │   ├── api/            # API client
│   │   ├── config/         # App configuration
│   │   ├── models/         # Data models
│   │   └── storage/        # Local storage
│   └── features/           # Feature modules
│       ├── onboarding/     # Welcome & Login
│       ├── output_tabs/    # Main content tabs
│       └── shared/         # Shared widgets
├── backend/                # Node.js API server
│   ├── src/
│   │   ├── routes/         # API routes
│   │   ├── services/       # Business logic & AI
│   │   └── storage/        # Database layer
│   ├── prisma/             # Database schema
│   └── deploy/             # Deployment configs
├── docs/                   # Documentation
└── scripts/                # Build scripts
```

## Quick Start

### Prerequisites

- Flutter SDK 3.10+
- Node.js 18+
- OpenAI API key

### Backend Setup

```bash
cd backend

# Install dependencies
npm install

# Create environment file
cp .env.development .env

# Add your OpenAI API key to .env
# OPENAI_API_KEY=your-key-here

# Start server
npm start
```

### Flutter App Setup

```bash
# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build --delete-conflicting-outputs

# Run app (development)
flutter run

# Run app connected to local backend
flutter run --dart-define=USE_MOCK=false
```

## Building for Production

### Android

```bash
# Using build script
./scripts/build-android.sh prod

# Manual build
flutter build appbundle --release \
  --dart-define=API_BASE_URL=https://api.mythicjung.com \
  --dart-define=USE_MOCK=false \
  --dart-define=PRODUCTION=true
```

### iOS

```bash
# Using build script
./scripts/build-ios.sh prod

# Manual build
flutter build ios --release \
  --dart-define=API_BASE_URL=https://api.mythicjung.com \
  --dart-define=USE_MOCK=false \
  --dart-define=PRODUCTION=true
```

## Environment Variables

### Backend

| Variable | Required | Description |
|----------|----------|-------------|
| `OPENAI_API_KEY` | Yes | OpenAI API key |
| `DATABASE_URL` | Prod only | PostgreSQL connection string |
| `PORT` | No | Server port (default: 3001) |
| `NODE_ENV` | No | Environment (development/production) |

### Flutter Build Arguments

| Argument | Default | Description |
|----------|---------|-------------|
| `API_BASE_URL` | `http://127.0.0.1:3001` | Backend API URL |
| `USE_MOCK` | `false` | Use mock data |
| `PRODUCTION` | `false` | Production build |

## Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for complete deployment instructions including:

- GCP VM setup with Nginx and PostgreSQL
- SSL certificate configuration
- Google Play Store submission
- Apple App Store submission

## Documentation

- [Deployment Guide](DEPLOYMENT.md)
- [Privacy Policy](docs/PRIVACY_POLICY.md)
- [App Store Checklist](docs/APP_STORE_CHECKLIST.md)
- [UI Design Guide](UI_DESIGN_GUIDE.md)

## API Endpoints

### Users
- `POST /v1/users/login` - Login or create user
- `GET /v1/users/:id/status` - Get user status
- `GET /v1/users/:id/sync` - Sync all user data

### Profile
- `POST /v1/profile` - Save character selections
- `GET /v1/profile` - Get user profile

### Generation
- `POST /v1/generate/me` - Generate psychological analysis
- `GET /v1/output/me` - Get cached output

### Relationships
- `POST /v1/relationship/settings` - Save relationship config
- `POST /v1/relationship/generate` - Generate relationship analysis

## Tech Stack

### Frontend
- Flutter 3.10+
- Riverpod (state management)
- Go Router (navigation)
- Dio (HTTP client)
- Drift (local database)
- Freezed (code generation)

### Backend
- Node.js 18+
- Express.js
- Prisma ORM
- PostgreSQL
- OpenAI GPT-4
- Redis (optional caching)

## License

Proprietary - All rights reserved

## Support

For support, email support@mythicjung.com
