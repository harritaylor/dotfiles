#!/bin/bash

mkdir -p "$HOME/.config"
# setup xdg config
for dir in config/*/; do
    [ -d "$dir" ] || continue
    dirname=$(basename "$dir")
    target="$HOME/.config/$dirname"
    
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Warning: $target already exists and is not a symlink. Skipping $dirname."
        continue
    fi
    
    # Remove existing symlink if it exists
    [ -L "$target" ] && rm "$target"
    
    ln -sf "$PWD/$dir" "$target"
    echo "Created symlink: $target -> $PWD/$dir"
done

# setup home dotfiles
for file in home/*; do
    [ -f "$file" ] || continue
    filename=$(basename "$file")
    target="$HOME/$filename"
    
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Warning: $target already exists and is not a symlink. Skipping $filename."
        continue
    fi
    
    [ -L "$target" ] && rm "$target"
    ln -sf "$PWD/$file" "$target"
    echo "Created symlink: $target -> $PWD/$file"
done
