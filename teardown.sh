#!/bin/sh
set -e

# Shell
rm "$HOME/.bashrc"
rm "$HOME/.inputrc"
rm "$HOME/.profile"
rm "$HOME/.bash_profile"

# Neovim
rm -rf "$HOME/.config/nvim"
