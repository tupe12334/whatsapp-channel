#!/bin/bash

# Publish script: Translate missing files and add requirements footer

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Step 1: Adding requirements footer ==="
"$SCRIPT_DIR/add-requirements.sh"

echo ""
echo "=== Step 2: Translating missing he.md files ==="
"$SCRIPT_DIR/translate-missing.sh"

echo ""
echo "=== Done! ==="
