#!/bin/bash

# Add TL;DR section to English content using Claude Code
# Creates en.with-tldr.md as intermediate file
# Regenerates if source is newer than the output file

find . -name "en.md" -type f | while read -r en_file; do
    dir=$(dirname "$en_file")
    tldr_file="$dir/en.with-tldr.md"
    fixed_file="$dir/en.typos-fixed.md"

    # Prefer en.typos-fixed.md if it exists, otherwise use en.md
    if [ -f "$fixed_file" ]; then
        source_file="$fixed_file"
    else
        source_file="$en_file"
    fi

    # Check if tldr file needs to be (re)generated
    should_generate=false
    if [ ! -f "$tldr_file" ]; then
        should_generate=true
    elif [ "$source_file" -nt "$tldr_file" ]; then
        should_generate=true
        echo "Source updated: $source_file is newer than $tldr_file"
    fi

    if [ "$should_generate" = false ]; then
        echo "Skipping: $tldr_file is up to date"
        continue
    fi

    echo "Adding TL;DR: $source_file -> $tldr_file"

    # Read the source content
    content=$(cat "$source_file")

    # Generate TL;DR using Claude
    tldr=$(claude -p "Read this article and write a very brief TL;DR summary (2-3 sentences max). Output ONLY the summary text, no 'TL;DR:' prefix, no markdown formatting, no explanations:" <<< "$content")

    # Write file with TL;DR section after the title
    # Extract the first line (title) and the rest of the content
    title=$(head -n 1 "$source_file")
    rest=$(tail -n +2 "$source_file")

    cat > "$tldr_file" << EOF
$title

> **TL;DR:** $tldr
$rest
EOF

done

echo "Done!"
