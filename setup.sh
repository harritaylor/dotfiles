## calonaur's dotfiles - setup.sh
#  designed to be compatible with out the box macOS / debian
#  bash && vim 8.0 / nvim

# vim / neovim
mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/vimrc" "$HOME/.vimrc"
ln -sf "$PWD/init.vim" "$HOME/.config/nvim/init.vim"

# git
ln -sf "$PWD/gitignore" "$HOME/.gitignore"
ln -sf "$PWD/gitconfig" "$HOME/.gitconfig"

# login & input
ln -sf "$PWD/hushlogin" "$HOME/.hushlogin"
ln -sf "$PWD/inputrc" "$HOME/.inputrc"

# bash
ln -sf "$PWD/profile" "$HOME/.profile"

# tmux
ln -sf "$PWD/tmux.conf" "$HOME/.tmux.conf"
