#!/bin/bash
# =============================================================================
# MYTHIC JUNG - ANDROID BUILD SCRIPT
# =============================================================================
# Usage: ./scripts/build-android.sh [dev|staging|prod]

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Default environment
ENV=${1:-prod}

# Configuration based on environment
case $ENV in
    dev|development)
        echo -e "${YELLOW}Building for DEVELOPMENT${NC}"
        API_URL="http://127.0.0.1:3001"
        USE_MOCK="false"
        PRODUCTION="false"
        FLAVOR="development"
        ;;
    staging)
        echo -e "${YELLOW}Building for STAGING${NC}"
        API_URL="https://api-staging.mythicjung.com"
        USE_MOCK="false"
        PRODUCTION="false"
        FLAVOR="staging"
        ;;
    prod|production)
        echo -e "${YELLOW}Building for PRODUCTION${NC}"
        API_URL="https://api.mythicjung.com"
        USE_MOCK="false"
        PRODUCTION="true"
        FLAVOR="production"
        ;;
    *)
        echo -e "${RED}Invalid environment: $ENV${NC}"
        echo "Usage: $0 [dev|staging|prod]"
        exit 1
        ;;
esac

echo ""
echo "Configuration:"
echo "  Environment: $ENV"
echo "  API URL: $API_URL"
echo "  Flavor: $FLAVOR"
echo ""

# Clean build
echo -e "${GREEN}Cleaning previous builds...${NC}"
flutter clean
flutter pub get

# Build APK
echo -e "${GREEN}Building APK...${NC}"
flutter build apk --release \
    --flavor $FLAVOR \
    --dart-define=API_BASE_URL=$API_URL \
    --dart-define=USE_MOCK=$USE_MOCK \
    --dart-define=PRODUCTION=$PRODUCTION \
    --dart-define=APP_VERSION=$(grep 'version:' pubspec.yaml | sed 's/version: //')

# Build App Bundle (for Play Store)
echo -e "${GREEN}Building App Bundle...${NC}"
flutter build appbundle --release \
    --flavor $FLAVOR \
    --dart-define=API_BASE_URL=$API_URL \
    --dart-define=USE_MOCK=$USE_MOCK \
    --dart-define=PRODUCTION=$PRODUCTION \
    --dart-define=APP_VERSION=$(grep 'version:' pubspec.yaml | sed 's/version: //')

echo ""
echo -e "${GREEN}Build Complete!${NC}"
echo ""
echo "Output files:"
echo "  APK: build/app/outputs/flutter-apk/app-${FLAVOR}-release.apk"
echo "  AAB: build/app/outputs/bundle/${FLAVOR}Release/app-${FLAVOR}-release.aab"
echo ""
echo "For Play Store upload, use the .aab file"
