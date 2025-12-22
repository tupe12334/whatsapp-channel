#!/bin/bash

# Publish script: Translate missing files and add requirements footer

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Step 1: Fixing English typos ==="
"$SCRIPT_DIR/scripts/fix-typos.sh"

echo ""
echo "=== Step 2: Adding requirements footer ==="
"$SCRIPT_DIR/scripts/add-requirements.sh"

echo ""
echo "=== Step 3: Translating missing he.md files ==="
"$SCRIPT_DIR/scripts/translate-missing.sh"

echo ""
echo "=== Step 4: Converting Hebrew markdown to WhatsApp format ==="
"$SCRIPT_DIR/scripts/convert-to-whatsapp.sh"

echo ""
echo "=== Done! ==="
