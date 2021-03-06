## calonaur's dotfiles - setup.sh
#  designed to be compatible with out the box macOS / debian
#  bash && vim 8.0 / nvim

# vim / neovim
# mkdir -p "$HOME/.config/nvim"
ln -sf "$PWD/vimrc" "$HOME/.vimrc"
# ln -sf "$PWD/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$PWD/nvim" "$HOME/.config/nvim"

# emacs 
ln -sf "$PWD/doomd" "$HOME/.doom.d"


# git
ln -sf "$PWD/gitignore" "$HOME/.gitignore"
ln -sf "$PWD/gitconfig" "$HOME/.gitconfig"

# login & input
ln -sf "$PWD/hushlogin" "$HOME/.hushlogin"
ln -sf "$PWD/inputrc" "$HOME/.inputrc"

# bash
ln -sf "$PWD/profile" "$HOME/.profile"
ln -sf "$PWD/bashrc" "$HOME/.bashrc"

# tmux
ln -sf "$PWD/tmux.conf" "$HOME/.tmux.conf"

# alacritty
mkdir -p "$HOME/.config/alacritty"
ln -sf "$PWD/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
