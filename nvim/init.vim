if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-commentary'

    Plug 'sheerun/vim-polyglot'

    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'lervag/wiki.vim'
call plug#end()



autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" configs
let g:wiki_root = '~/Notes'
let g:mapleader = "\<Space>"
nnoremap <leader>w<leader>j :WikiJournalNext<CR>
nnoremap <leader>w<leader>k :WikiJournalPrev<CR>
