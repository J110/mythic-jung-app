#!/bin/bash
# =============================================================================
# MYTHIC JUNG - iOS BUILD SCRIPT
# =============================================================================
# Usage: ./scripts/build-ios.sh [dev|staging|prod]
#
# Prerequisites:
#   - macOS with Xcode installed
#   - Valid Apple Developer account
#   - Provisioning profiles and certificates configured

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
        SCHEME="development"
        ;;
    staging)
        echo -e "${YELLOW}Building for STAGING${NC}"
        API_URL="http://127.0.0.1:3001"
        USE_MOCK="false"
        PRODUCTION="false"
        SCHEME="staging"
        ;;
    prod|production)
        echo -e "${YELLOW}Building for PRODUCTION${NC}"
        API_URL="https://bliss-backend-prod.vervetogether.com"
        USE_MOCK="false"
        PRODUCTION="true"
        SCHEME="production"
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
echo "  Scheme: $SCHEME"
echo ""

# Check for macOS
if [[ "$(uname)" != "Darwin" ]]; then
    echo -e "${RED}iOS builds require macOS${NC}"
    exit 1
fi

# Clean build
echo -e "${GREEN}Cleaning previous builds...${NC}"
flutter clean
flutter pub get

# Build iOS
echo -e "${GREEN}Building iOS...${NC}"
flutter build ios --release \
    --dart-define=API_BASE_URL=$API_URL \
    --dart-define=USE_MOCK=$USE_MOCK \
    --dart-define=PRODUCTION=$PRODUCTION \
    --dart-define=APP_VERSION=$(grep 'version:' pubspec.yaml | sed 's/version: //')

echo ""
echo -e "${GREEN}Build Complete!${NC}"
echo ""
echo "Next steps:"
echo "1. Open ios/Runner.xcworkspace in Xcode"
echo "2. Select your target device/scheme"
echo "3. Product > Archive"
echo "4. Distribute App > App Store Connect"
echo ""
echo "For automated upload, you can use:"
echo "  xcodebuild -workspace ios/Runner.xcworkspace \\"
echo "    -scheme Runner \\"
echo "    -configuration Release \\"
echo "    -archivePath build/ios/Runner.xcarchive \\"
echo "    archive"
