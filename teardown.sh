#!/bin/sh
set -e

# Shell
ln -sf "$PWD/.bashrc" "$HOME/.bashrc"
ln -sf "$PWD/.inputrc" "$HOME/.inputrc"
ln -sf "$PWD/.profile" "$HOME/.profile"
ln -sf "$PWD/.profile" "$HOME/.bash_profile"

# VSCode
ln -sf "$PWD/settings.json" "$HOME/.config/Code/User"

# Neovim
ln -sf "$PWD/init.vim" "$HOME/.config/nvim"
