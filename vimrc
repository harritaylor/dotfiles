if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

if filereadable(expand("~/.vim/autoload/plug.vim"))
call plug#begin('~/.vim/autoload/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'
    Plug 'sheerun/vim-polyglot'

    " Plug 'airblade/vim-gitgutter'
    " Plug 'tpope/vim-fugitive'
    " Plug 'lervag/wiki.vim'
call plug#end()
endif

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" configs
let mapleader = "\<Space>"
