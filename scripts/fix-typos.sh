#!/bin/bash

# Fix English typos in en.md files using Claude Code
# Creates en.typos-fixed.md as intermediate file
# Regenerates if en.md is newer than the fixed file

find . -name "en.md" -type f | while read -r en_file; do
    dir=$(dirname "$en_file")
    fixed_file="$dir/en.typos-fixed.md"

    # Check if fixed file needs to be (re)generated
    should_generate=false
    if [ ! -f "$fixed_file" ]; then
        should_generate=true
    elif [ "$en_file" -nt "$fixed_file" ]; then
        should_generate=true
        echo "Source updated: $en_file is newer than $fixed_file"
    fi

    if [ "$should_generate" = true ]; then
        echo "Fixing typos: $en_file -> $fixed_file"
        claude -p "Fix any English spelling and grammar typos in this markdown content. Keep the markdown formatting intact. Output only the corrected content, no explanations:" < "$en_file" > "$fixed_file"
    else
        echo "Skipping: $fixed_file is up to date"
    fi
done

echo "Done!"
