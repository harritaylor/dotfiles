let mapleader = " "

if empty(glob("$HOME/.vim/autoload/plug.vim"))
  silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter & PlugInstall 
endif

if filereadable(expand("$HOME/.vim/autoload/plug.vim"))
  call plug#begin("$HOME/.vim/plugged")

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-obsession'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " Plug 'lervag/wiki.vim'
  Plug 'https://github.com/alok/notational-fzf-vim'

  " Plug 'plasticboy/vim-markdown'
  Plug 'flazz/vim-colorschemes'
  " Plug 'sheerun/vim-polyglot'
  Plug 'airblade/vim-gitgutter'
  " Plug 'tpope/vim-fugitive'
  " Plug 'mbbill/undotree'
  Plug 'tpope/vim-commentary'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  " Plug 'tpope/vim-surround'
  " Plug 'christoomey/vim-tmux-navigator'
  " Plug 'jpalardy/vim-slime'
  " Plug 'djoshea/vim-autoread'

  call plug#end()

  " junegunn/fzf
  nmap <leader>pt :Rg <C-R>=("TODO")<CR><CR> 
  nmap <leader>po :GFiles<CR>
  nmap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
  nmap <leader>ps :Rg<SPACE>

  "
  let g:nv_search_paths = ['~/Dropbox/notes']

  " lervag/wiki.vim
  function WikiCreateMap(text) abort
    return substitute(tolower(a:text), '\s\+', '-', 'g')
  endfunction

  function! WikiRoot()
    let l:local = finddir('notes', ';./')
    return !empty(l:local) ? l:local : '~/Dropbox/notes'
  endfunction

  let g:wiki_root = 'WikiRoot'
  let g:wiki_map_create_page = 'WikiCreateMap'
  let g:wiki_filetypes = ['md']
  let g:wiki_link_extension = '.md'
  let g:wiki_write_on_nav = 1
  let g:wiki_map_link_create = 'WikiCreateMap'
  let g:wiki_list_todos = ['[ ]', '[x]']

  " liuchengxu/vim-which-key
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

  " plasticboy/vim-markdown
  let g:vim_markdown_math = 1
  let g:vim_markdown_edit_url_in = 'hsplit'
  let g:vim_markdown_new_list_item_indent = 0 


  " flazz/vim-colorschemes
  colorscheme gruvbox
  set background=dark

"   " tpope/vim-fugitive
"   nmap <leader>gs :G<CR>
"   nmap <leader>gn :diffget //3<CR>
"   nmap <leader>gt :diffget //2<CR>

"   " mbbill/undotree
"   nmap <leader>u :UndotreeShow<CR>

  " jpalardy/vim-slime
  let g:slime_target = "tmux"
  let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}

endif
