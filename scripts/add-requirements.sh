#!/bin/bash

# Add requirements footer to en.md (creates en.published.md) and he.md files

WHATSAPP_LINK="https://whatsapp.com/channel/0029Vb7ZXok5kg7Di82iSt1S"
REPO_BASE="https://github.com/tupe12334/whatsapp-channel/blob/main"

# Process en.md files - create en.published.md instead of mutating
find . -type f -name "en.md" | while read -r file; do
    dir=$(dirname "$file")
    published_file="$dir/en.published.md"

    # Skip if published file already has the footer
    if [ -f "$published_file" ] && grep -q "ZoomOut WhatsApp Channel" "$published_file"; then
        echo "Skipping: $published_file (footer already exists)"
        continue
    fi

    # Get relative path for repository link
    rel_path="${file#./}"

    echo "Creating: $published_file (from $file with footer)"

    # Copy original content and add footer
    cat "$file" > "$published_file"
    cat >> "$published_file" << EOF

---

- [ZoomOut WhatsApp Channel]($WHATSAPP_LINK)
- [Source file]($REPO_BASE/$rel_path)
- Translated from English to Hebrew using Claude Code
EOF
done

# Process he.md files - append footer directly (these are generated files)
find . -type f -name "he.md" | while read -r file; do
    # Skip if file already has the footer
    if grep -q "ZoomOut WhatsApp Channel" "$file"; then
        echo "Skipping: $file (footer already exists)"
        continue
    fi

    # Get relative path for repository link
    rel_path="${file#./}"

    echo "Adding footer to: $file"

    cat >> "$file" << EOF

---

- [ערוץ ZoomOut WhatsApp]($WHATSAPP_LINK)
- [קובץ המקור]($REPO_BASE/$rel_path)
- תורגם באמצעות Claude Code
EOF
done

echo "Done!"
