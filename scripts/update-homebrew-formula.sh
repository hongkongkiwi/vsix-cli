#!/bin/bash

# Script to update the Homebrew formula with the latest version and SHA256
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the current version from the script
CURRENT_VERSION=$(grep "readonly SCRIPT_VERSION=" vsix-cli | cut -d'"' -f2)
FORMULA_FILE="Formula/vsix-cli.rb"

echo -e "${BLUE}Updating Homebrew formula for vsix-cli v${CURRENT_VERSION}${NC}"

# Check if formula file exists
if [[ ! -f "$FORMULA_FILE" ]]; then
    echo -e "${RED}Error: Formula file not found at $FORMULA_FILE${NC}"
    exit 1
fi

# Download the release file to calculate SHA256
RELEASE_URL="https://github.com/hongkongkiwi/vsix-cli/releases/download/v${CURRENT_VERSION}/vsix-cli"
TEMP_FILE=$(mktemp)

echo -e "${YELLOW}Downloading release file to calculate SHA256...${NC}"
if curl -sL "$RELEASE_URL" -o "$TEMP_FILE"; then
    SHA256=$(shasum -a 256 "$TEMP_FILE" | cut -d' ' -f1)
    rm "$TEMP_FILE"
    echo -e "${GREEN}SHA256: $SHA256${NC}"
else
    echo -e "${RED}Error: Could not download release file from $RELEASE_URL${NC}"
    echo -e "${YELLOW}Please ensure the release exists on GitHub${NC}"
    rm -f "$TEMP_FILE"
    exit 1
fi

# Update the formula file
echo -e "${YELLOW}Updating formula file...${NC}"

# Create a backup
cp "$FORMULA_FILE" "$FORMULA_FILE.bak"

# Update version and SHA256
sed -i.tmp "s|url \".*\"|url \"$RELEASE_URL\"|g" "$FORMULA_FILE"
sed -i.tmp "s|version \".*\"|version \"$CURRENT_VERSION\"|g" "$FORMULA_FILE"
sed -i.tmp "s|sha256 \".*\"|sha256 \"$SHA256\"|g" "$FORMULA_FILE"

# Clean up temporary files
rm -f "$FORMULA_FILE.tmp"

echo -e "${GREEN}Formula updated successfully!${NC}"
echo -e "${BLUE}Changes made:${NC}"
echo -e "  Version: ${CURRENT_VERSION}"
echo -e "  URL: ${RELEASE_URL}"
echo -e "  SHA256: ${SHA256}"

# Show diff
if command -v diff >/dev/null 2>&1; then
    echo -e "\n${BLUE}Diff:${NC}"
    diff "$FORMULA_FILE.bak" "$FORMULA_FILE" || true
fi

echo -e "\n${YELLOW}Next steps:${NC}"
echo -e "1. Review the changes in $FORMULA_FILE"
echo -e "2. Test the formula locally: ${BLUE}brew install --build-from-source $FORMULA_FILE${NC}"
echo -e "3. Commit and push the changes to your Homebrew tap repository"
echo -e "4. Create a pull request if contributing to an existing tap"

# Cleanup backup if everything went well
rm -f "$FORMULA_FILE.bak" 