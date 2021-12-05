#!/bin/sh
set -e

# Shell
rm "$HOME/.bashrc"
rm "$HOME/.inputrc"
rm "$HOME/.profile"
rm "$HOME/.bash_profile"
rm "$HOME/.hushlogin"
rm "$HOME/.tmux.conf"

# Neovim
rm -rf "$HOME/.config/nvim/"

# Local binaries
rm -rf "$HOME/.local/bin"