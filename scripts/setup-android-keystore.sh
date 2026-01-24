#!/bin/bash
# =============================================================================
# MYTHIC JUNG - ANDROID KEYSTORE SETUP SCRIPT
# =============================================================================
# This script helps you create a release keystore for Android app signing

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

KEYSTORE_DIR="android/app/keystore"
KEYSTORE_PATH="${KEYSTORE_DIR}/release.keystore"
LOCAL_PROPERTIES="android/local.properties"

echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}Android Release Keystore Setup${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

# Check if keystore already exists
if [ -f "$KEYSTORE_PATH" ]; then
    echo -e "${YELLOW}WARNING: Keystore already exists at: $KEYSTORE_PATH${NC}"
    read -p "Do you want to overwrite it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}Aborted. Using existing keystore.${NC}"
        exit 0
    fi
    rm -f "$KEYSTORE_PATH"
fi

# Create keystore directory if it doesn't exist
mkdir -p "$KEYSTORE_DIR"

# Prompt for keystore information
echo -e "${GREEN}Please provide the following information for your keystore:${NC}"
echo ""

# Get keystore password
read -sp "Enter keystore password (min 6 characters): " KEYSTORE_PASSWORD
echo ""
if [ ${#KEYSTORE_PASSWORD} -lt 6 ]; then
    echo -e "${RED}Error: Password must be at least 6 characters${NC}"
    exit 1
fi

read -sp "Confirm keystore password: " KEYSTORE_PASSWORD_CONFIRM
echo ""
if [ "$KEYSTORE_PASSWORD" != "$KEYSTORE_PASSWORD_CONFIRM" ]; then
    echo -e "${RED}Error: Passwords do not match${NC}"
    exit 1
fi

# Get key alias (default: mythicjung)
read -p "Enter key alias [mythicjung]: " KEY_ALIAS
KEY_ALIAS=${KEY_ALIAS:-mythicjung}

# Get key password
read -sp "Enter key password (can be same as keystore password): " KEY_PASSWORD
echo ""
if [ ${#KEY_PASSWORD} -lt 6 ]; then
    echo -e "${RED}Error: Password must be at least 6 characters${NC}"
    exit 1
fi

read -sp "Confirm key password: " KEY_PASSWORD_CONFIRM
echo ""
if [ "$KEY_PASSWORD" != "$KEY_PASSWORD_CONFIRM" ]; then
    echo -e "${RED}Error: Passwords do not match${NC}"
    exit 1
fi

# Get other information
read -p "Enter your first and last name: " NAME
read -p "Enter organizational unit [Development]: " ORG_UNIT
ORG_UNIT=${ORG_UNIT:-Development}
read -p "Enter organization [Mythic Jung]: " ORGANIZATION
ORGANIZATION=${ORGANIZATION:-Mythic Jung}
read -p "Enter city or locality: " CITY
read -p "Enter state or province: " STATE
read -p "Enter two-letter country code (e.g., US): " COUNTRY

echo ""
echo -e "${GREEN}Creating keystore...${NC}"

# Create the keystore
keytool -genkey -v \
    -keystore "$KEYSTORE_PATH" \
    -alias "$KEY_ALIAS" \
    -keyalg RSA \
    -keysize 2048 \
    -validity 10000 \
    -storepass "$KEYSTORE_PASSWORD" \
    -keypass "$KEY_PASSWORD" \
    -dname "CN=$NAME, OU=$ORG_UNIT, O=$ORGANIZATION, L=$CITY, ST=$STATE, C=$COUNTRY"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Keystore created successfully!${NC}"
else
    echo -e "${RED}✗ Failed to create keystore${NC}"
    exit 1
fi

# Update local.properties
echo ""
echo -e "${GREEN}Updating android/local.properties...${NC}"

# Create local.properties if it doesn't exist
if [ ! -f "$LOCAL_PROPERTIES" ]; then
    touch "$LOCAL_PROPERTIES"
    echo "# Android SDK location" >> "$LOCAL_PROPERTIES"
    echo "sdk.dir=\${ANDROID_HOME}" >> "$LOCAL_PROPERTIES"
    echo "" >> "$LOCAL_PROPERTIES"
fi

# Remove existing signing config if present
sed -i.bak '/^KEYSTORE_PATH=/d' "$LOCAL_PROPERTIES" 2>/dev/null || true
sed -i.bak '/^KEYSTORE_PASSWORD=/d' "$LOCAL_PROPERTIES" 2>/dev/null || true
sed -i.bak '/^KEY_ALIAS=/d' "$LOCAL_PROPERTIES" 2>/dev/null || true
sed -i.bak '/^KEY_PASSWORD=/d' "$LOCAL_PROPERTIES" 2>/dev/null || true
rm -f "${LOCAL_PROPERTIES}.bak"

# Add signing configuration
echo "" >> "$LOCAL_PROPERTIES"
echo "# Release signing configuration" >> "$LOCAL_PROPERTIES"
echo "KEYSTORE_PATH=keystore/release.keystore" >> "$LOCAL_PROPERTIES"
echo "KEYSTORE_PASSWORD=$KEYSTORE_PASSWORD" >> "$LOCAL_PROPERTIES"
echo "KEY_ALIAS=$KEY_ALIAS" >> "$LOCAL_PROPERTIES"
echo "KEY_PASSWORD=$KEY_PASSWORD" >> "$LOCAL_PROPERTIES"

echo -e "${GREEN}✓ Configuration updated!${NC}"

echo ""
echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Setup Complete!${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "${YELLOW}IMPORTANT:${NC}"
echo "1. Keep your keystore file and passwords safe!"
echo "2. The keystore is required to publish updates to your app."
echo "3. If you lose the keystore, you won't be able to update your app."
echo "4. The keystore file is in .gitignore and won't be committed."
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Build your release AAB: ./scripts/build-android.sh prod"
echo "2. Upload the AAB file to Google Play Console"
echo ""