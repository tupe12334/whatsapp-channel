#!/bin/bash

# Add requirements footer to all en.md and he.md files

WHATSAPP_LINK="https://whatsapp.com/channel/0029Vb7ZXok5kg7Di82iSt1S"
REPO_BASE="https://github.com/tupe12334/whatsapp-channel/blob/main"

find . -type f \( -name "en.md" -o -name "he.md" \) | while read -r file; do
    # Skip if file already has the footer
    if grep -q "ZoomOut WhatsApp Channel" "$file"; then
        echo "Skipping: $file (footer already exists)"
        continue
    fi

    # Get relative path for repository link
    rel_path="${file#./}"

    echo "Adding footer to: $file"

    # Add footer based on language
    if [[ "$file" == *"he.md" ]]; then
        cat >> "$file" << EOF

---

- [ערוץ ZoomOut WhatsApp]($WHATSAPP_LINK)
- [קובץ המקור]($REPO_BASE/$rel_path)
- תורגם באמצעות Claude Code
EOF
    else
        cat >> "$file" << EOF

---

- [ZoomOut WhatsApp Channel]($WHATSAPP_LINK)
- [Source file]($REPO_BASE/$rel_path)
- Translated from English to Hebrew using Claude Code
EOF
    fi
done

echo "Done!"
