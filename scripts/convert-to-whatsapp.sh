#!/bin/bash

# Convert Hebrew markdown files to WhatsApp-compatible text format

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Find all he.md files
find "$PROJECT_ROOT" -name "he.md" -type f | while read -r md_file; do
    dir=$(dirname "$md_file")
    txt_file="$dir/he.txt"

    # Check if txt file needs to be (re)generated
    if [ -f "$txt_file" ] && [ "$txt_file" -nt "$md_file" ]; then
        echo "Skipping: $txt_file is up to date"
        continue
    fi

    echo "Converting: $md_file -> $txt_file"
    pnpm dlx md-to-whatsapp "$md_file" > "$txt_file"
done

echo "Done converting Hebrew markdown files to WhatsApp format."
