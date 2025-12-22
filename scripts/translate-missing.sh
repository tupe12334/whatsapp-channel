#!/bin/bash

# Find all en.md files and translate to Hebrew if he.md doesn't exist
# Uses en.with-tldr.md > en.typos-fixed.md > en.md (content without footer)
# Footer is added separately by footer-generation.sh

find . -name "en.md" -type f | while read -r en_file; do
    dir=$(dirname "$en_file")
    he_file="$dir/he.md"
    tldr_file="$dir/en.with-tldr.md"
    fixed_file="$dir/en.typos-fixed.md"

    if [ ! -f "$he_file" ]; then
        # Priority: en.with-tldr.md > en.typos-fixed.md > en.md
        # Do NOT use en.published.md (has footer that would get translated)
        if [ -f "$tldr_file" ]; then
            source_file="$tldr_file"
        elif [ -f "$fixed_file" ]; then
            source_file="$fixed_file"
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
