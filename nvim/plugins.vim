" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  " Org !
  Plug 'jceb/vim-orgmode'

  " make netrw more gooder
  Plug 'tpope/vim-vinegar'

  " I don't care that much about settings
  Plug 'tpope/vim-sensible'

  " Comments
  Plug 'tpope/vim-commentary'

  " Follow you around
  Plug 'airblade/vim-rooter'

  " start screen
  Plug 'mhinz/vim-startify'

  " zen mode
  Plug 'junegunn/goyo.vim'

  " snippets
  Plug 'honza/vim-snippets'
  " or
  Plug 'mattn/emmet-vim'

  " reminders for what things do
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

  " contextual scrolling
  Plug 'psliwka/vim-smoothie'

  " treeshitter
  " Plug 'nvim-treesitter/nvim-treesitter'

  " Intellisense
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'

  " FZF
  Plug 'junegunn/fzf', { 'do': { ->fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'alok/notational-fzf-vim'

  " Themes
  Plug 'flazz/vim-colorschemes'

  " TMUX Integration
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jpalardy/vim-slime'

  " undo
  Plug 'mbbill/undotree'

  " Better syntax
  Plug 'sheerun/vim-polyglot'

  " Better movement
  Plug 'easymotion/vim-easymotion'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'rhysd/git-messenger.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

