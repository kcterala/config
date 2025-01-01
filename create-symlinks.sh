#!/bin/bash

### Terminal config
SOURCE_ZSHRC_DIR="$(pwd)/terminal/.zsh"
TARGET_ZSHRC_DIR="$HOME/.zsh"

SOURCE_ZSHRC="$(pwd)/terminal/.zshrc"
TARGET_ZSHRC="$HOME/.zshrc"

# Remove the existing .zshrc file and .zsh file
rm -rf "$TARGET_ZSHRC_DIR"
rm -f "$TARGET_ZSHRC"

ln -s "$SOURCE_ZSHRC_DIR" "$TARGET_ZSHRC_DIR"
ln -s "$SOURCE_ZSHRC" "$TARGET_ZSHRC"
echo "Created symlink for .zshrc file and .zsh directory"

### P10K configuration
SOURCE_P10K="$(pwd)/terminal/.p10k.zsh"
TARGET_P10K="$HOME/.p10k.zsh"

# Remove the existing .p10k.zsh
rm -f "$TARGET_P10K"

ln -s "$SOURCE_P10K" "$TARGET_P10K"
echo "Created symlink for .p10k.zsh"
echo

### GIT config
SOURCE_GIT_DIR="$(pwd)/git"
TARGET_GIT_DIR="$HOME"

# Loop through all files in the source .git directory
shopt -s dotglob
for source_file in "$SOURCE_GIT_DIR"/*git*; do
    filename=$(basename "$source_file")
    target_file="$TARGET_GIT_DIR/$filename"

    if [ -f "$target_file" ]; then
        echo "$filename already exists, skipping symlink creation. Please do this manually."
    else
        echo "Creating symlink for $filename"
        ln -s "$source_file" "$target_file"
    fi
done
shopt -u dotglob
echo


# Sublime Text config
SUBLIME_SOURCE_DIR="$(pwd)/sublime-text"
SUBLIME_TARGET_DIR="$HOME/Library/Application Support/Sublime Text/Packages/User"

# Only process Sublime settings if target directory exists
if [ -d "$SUBLIME_TARGET_DIR" ]; then
    echo "Found Sublime Text directory, creating symlinks..."
    for source_file in "$SUBLIME_SOURCE_DIR"/*.sublime-settings; do
        if [ -f "$source_file" ]; then
            filename=$(basename "$source_file")
            target_file="$SUBLIME_TARGET_DIR/$filename"
            rm -f "$target_file"
            ln -s "$source_file" "$target_file"
            echo "  Created symlink for $filename"
        fi
    done
fi