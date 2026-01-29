#!/bin/bash
# update-markdown-lists.sh
# Run this script from your repo root to update all markdown file lists
# Usage: ./update-markdown-lists.sh

echo "🔍 Scanning for directories with markdown files..."

# Find all directories containing .md files (excluding .git)
find . -name "*.md" -not -path "./.git/*" -exec dirname {} \; | sort -u | while read -r dir; do
    echo "📝 Processing: $dir"
    
    cd "$dir" || continue
    
    # Create JSON array of markdown files (sorted reverse chronologically)
    {
        echo -n "["
        first=true
        for file in $(ls -1 *.md 2>/dev/null | sort -r); do
            if [ "$first" = true ]; then
                first=false
            else
                echo -n ","
            fi
            echo -n "\"$file\""
        done
        echo "]"
    } > .markdown-files.json
    
    count=$(ls -1 *.md 2>/dev/null | wc -l)
    echo "   ✓ Generated .markdown-files.json ($count files)"
    
    cd - > /dev/null || exit
done

echo ""
echo "✅ Done! All .markdown-files.json updated."
echo "💡 Don't forget to commit the .markdown-files.json files!"