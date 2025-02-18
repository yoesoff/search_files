#!/bin/bash

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <folder_path> <word1,word2,word3,...>"
    exit 1
fi

FOLDER=$1
WORDS=$(echo "$2" | tr ',' '|')  # Convert comma-separated words into a regex pattern

# Check if the folder exists
if [ ! -d "$FOLDER" ]; then
    echo "Error: Folder '$FOLDER' does not exist."
    exit 1
fi

echo "Searching in folder: $FOLDER"
echo "Looking for words: $2"
echo "================================================="

# Use find to get real files and filter with grep
find "$FOLDER" -type f | while read -r file; do
    grep -InE "$WORDS" "$file" --color=always | while IFS= read -r line; do
        LINE_NUM=$(echo "$line" | cut -d':' -f1)
        CONTENT=$(echo "$line" | cut -d':' -f2-)
        
        echo -e "File: \033[1;34m$file\033[0m"
        echo -e "Line: \033[1;33m$LINE_NUM\033[0m"
        echo -e "Match: \033[1;32m$CONTENT\033[0m"
        echo "-------------------------------------------------"
    done
done

