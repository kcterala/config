#!/bin/bash

### ZSHRC config
SOURCE_ZSHRC="$(pwd)/terminal/.zshrc"
TARGET_ZSHRC="$HOME/.zshrc"

# Remove the existing .zshrc file
rm -f "$TARGET_ZSHRC"

echo "Creating symlink for .zshrc"
ln -s "$SOURCE_ZSHRC" "$TARGET_ZSHRC"


### P10K configuration
SOURCE_P10K="$(pwd)/terminal/.p10k.zsh"
TARGET_P10K="$HOME/.p10k.zsh"

# Remove the existing .p10k.zsh
rm -f "$TARGET_P10K"

echo "Creating symlink for .p10k.zsh"
ln -s "$SOURCE_P10K" "$TARGET_P10K"



### GIT config
SOURCE_GIT_CONFIG="$(pwd)/git/.gitignore"
TARGET_GIT_CONFIG="$HOME/.gitignore"

rm -f "$TARGET_GIT_CONFIG"

echo "Creating symlink for .gitignore"
ln -s "$SOURCE_GIT_CONFIG" "$TARGET_GIT_CONFIG"


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
            echo "Created symlink for $filename"
        fi
    done
fi