#!/bin/sh
set -e

# Shell
ln -sf "$PWD/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/inputrc" "$HOME/.inputrc"
ln -sf "$PWD/profile" "$HOME/.profile"
ln -sf "$PWD/profile" "$HOME/.bash_profile"
ln -sf "$PWD/hushlogin" "$HOME/.hushlogin"
ln -sf "$PWD/tmuxconf" "$HOME/.tmux.conf"
ln -sf "$PWD/gitignore" "$HOME/.gitignore"

# Programs that require a directory in the .config dir
mkdir -p "$HOME/.config/"

# Neovim
ln -sf "$PWD/nvim/" "$HOME/.config/"

# Install the local binary directory
mkdir -p "$HOME/.local/"
ln -sf "$PWD/bin" "$HOME/.local/"
