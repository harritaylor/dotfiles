#!/bin/sh
set -e

# Shell
ln -sf "$PWD/bashrc" "$HOME/.bashrc"
ln -sf "$PWD/inputrc" "$HOME/.inputrc"
ln -sf "$PWD/profile" "$HOME/.profile"
ln -sf "$PWD/profile" "$HOME/.bash_profile"


# Programs that require a directory in the .config dir
mkdir -p "$HOME/.config/"

# Neovim
ln -sf "$PWD/nvim/" "$HOME/.config/"
