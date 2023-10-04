#!/bin/bash

echo "Enter the path to the directory containing GC ISO files: "
read inputDirectory

echo "Enter the path to nintendont games directory: "
read outputDirectory

if [ ! -d "$inputDirectory" ]; then
    echo "Input directory does not exist."
    exit 1
fi

if [ ! -d "$outputDirectory" ]; then
    mkdir -p "$outputDirectory"
fi

for file in "$inputDirectory"/*; do
    if [ -f "$file" ]; then
        folderName=$(basename "$file" | sed 's/\.[^.]*$//')
        mkdir -p "$outputDirectory/$folderName"
        cp "$file" "$outputDirectory/$folderName/game.iso"
    fi
done

echo "Task completed."
exit 0
