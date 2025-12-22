#!/bin/bash

# Publish script: Process and translate markdown files with footers

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Step 1: Fixing English typos ==="
"$SCRIPT_DIR/scripts/fix-typos.sh"

echo ""
echo "=== Step 2: Adding TL;DR summaries ==="
"$SCRIPT_DIR/scripts/add-tldr.sh"

echo ""
echo "=== Step 3: Translating missing he.md files ==="
"$SCRIPT_DIR/scripts/translate-missing.sh"

echo ""
echo "=== Step 4: Generating footers ==="
"$SCRIPT_DIR/scripts/footer-generation.sh"

echo ""
echo "=== Step 5: Converting Hebrew markdown to WhatsApp format ==="
"$SCRIPT_DIR/scripts/convert-to-whatsapp.sh"

echo ""
echo "=== Done! ==="
