#!/bin/bash

# Find all en.md files and translate to Hebrew if he.md doesn't exist
# Prefers en.published.md (with footer) over en.md if available

find . -name "en.md" -type f | while read -r en_file; do
    dir=$(dirname "$en_file")
    he_file="$dir/he.md"
    published_file="$dir/en.published.md"

    if [ ! -f "$he_file" ]; then
        # Prefer en.published.md if it exists, otherwise use en.md
        if [ -f "$published_file" ]; then
            source_file="$published_file"
        else
            source_file="$en_file"
        fi

        echo "Translating: $source_file -> $he_file"
        claude -p "Translate this markdown content to Hebrew. Keep the markdown formatting intact. Output only the translated content, no explanations:" < "$source_file" > "$he_file"
    else
        echo "Skipping: $he_file already exists"
    fi
done

echo "Done!"
