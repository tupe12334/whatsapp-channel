#!/bin/bash

# Find all en.md files and translate to Hebrew if he.md doesn't exist

find . -name "en.md" -type f | while read -r en_file; do
    dir=$(dirname "$en_file")
    he_file="$dir/he.md"

    if [ ! -f "$he_file" ]; then
        echo "Translating: $en_file -> $he_file"
        claude -p "Translate this markdown content to Hebrew. Keep the markdown formatting intact. Output only the translated content, no explanations:" < "$en_file" > "$he_file"
    else
        echo "Skipping: $he_file already exists"
    fi
done

echo "Done!"
