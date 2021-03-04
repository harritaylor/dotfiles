" harritaylor's ~/.vimrc
"
" designed for neovim and tmux.
" includes heavy lervag/wiki.vim integration, so please inspect
" and modify as necessary before using.
" defaults
let skip_defaults_vim=1
set nocompatible
filetype on

" https://swordandsignals.com/2020/12/13/5-lines-in-vimrc.html
set hlsearch    " highlight all search results
set incsearch   " show incremental search results as you type
set number      " display line number
set noswapfile  " disable swap file

" write files when changing buffer
set autowrite
" insert spaces instead of tabs
set softtabstop=2
set shiftwidth=2
" set smarttab
" avoid 'hit enter to...' messages
set shortmess=aoOtI
" prevent truncated yanks / deletes
set viminfo='20,<1000,s1000
" disable automatic folding
set foldmethod=manual
" don't complain about switching buffer with changes
set hidden
" search as you type
set ignorecase
" don't pass short messages
set shortmess+=c
" swapfiles are annoying
set noswapfile
" more prettier
set conceallevel=2

" command history
set history=100
" persistent undo
if has('persistent_undo')
  " create dirs
  silent !mkdir -p $HOME/.vim/
  silent !mkdir -p $HOME/.vim/undodir
  set undodir=$HOME/.vim/undodir
  set undofile
  
  silent !mkdir -p $HOME/.vim/backup
  set backupdir=$HOME/.vim/backup
  set backup
  set writebackup
  set backupcopy=yes
endif

" colours
syntax enable
" faster scrolling
set ttyfast
" inside voice
set noerrorbells
" no need to type noh
set nohlsearch
" enable 24-bit colour
if exists('+termguicolors')
  set termguicolors
endif
" reminder of the last line
set wrap
set linebreak
set textwidth=0
set colorcolumn=79
highlight ColorColumn ctermbg=0
set breakindent

if v:version < 703
  finish
endif
"" remaps & autocommands
let mapleader = " "
if has("autocmd")

  " jump to last position
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif

  " sensible backup names
  au BufWritePre * let &bex = '@' . strftime("%F_%H:%M")

  " keep cursor centered ("typewriter mode")
  augroup VCenterCursor
    au!
    au BufEnter,WinEnter,WinNew,VimResized *,*.*
      \ let &scrolloff=winheight(win_getid())/2
  augroup END

  " soft wrap at 79
  au VimResized * if (&columns > 79) | set columns=79 | endif

  " buffer syntax types
  au bufnewfile,bufRead *bash* set ft=sh

  " UK Spelling for markdown
  autocmd FileType markdown setlocal spell spelllang=en_gb

  " Auto save / load  buffers when entering or leaving
  au FocusGained,BufEnter * :silent! checktime
  au FocusLost,WinLeave * :silent! w
endif

"" Plugins

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
  Plug 'junegunn/vim-easy-align'
  " Plug 'lervag/wiki.vim'
  Plug 'harritaylor/wiki.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'godlygeek/tabular'
  Plug 'sheerun/vim-polyglot'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-commentary'
  Plug 'KeitaNakamura/tex-conceal.vim'
  Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  Plug 'tpope/vim-surround'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jpalardy/vim-slime'

  if has('nvim-0.5')
    Plug 'neovim/nvim-lspconfig' 
    " Plug 'hkupty/iron.nvim'
  endif

  call plug#end()

  " junegunn/fzf
  nmap <leader>pt :Rg <C-R>=("TODO")<CR><CR> 
  nmap <leader>po :GFiles<CR>
  nmap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
  nmap <leader>ps :Rg<SPACE>

  " lervag/wiki.vim
  function WikiCreateMap(text) abort
    return substitute(tolower(a:text), '\s\+', '-', 'g')
  endfunction

  function! WikiRoot()
    let l:local = finddir('notes', ';./')
    return !empty(l:local) ? l:local : '~/Documents/Notes/'
  endfunction

  let g:wiki_root = 'WikiRoot'
  let g:wiki_map_create_page = 'WikiCreateMap'
  let g:wiki_filetypes = ['md']
  let g:wiki_link_target_type = 'wiki'
  let g:wiki_write_on_nav = 1
  let g:wiki_link_toggle_on_open = 0
  let g:wiki_map_link_create = 'WikiCreateMap'
  let g:wiki_template_title_month = '# %(month-name) %(year)'
  let g:wiki_template_title_week = '# %(year),Week %(week)'

  " g:wiki_list_todos[0]

"   " custom wiki.vim function
"   function! Todos() abort "{{{1
"     if !exists('*fzf#run')
"       echo 'fzf must be installed for this to work.'
"       return
"     endif

"     let l:todo_string = get(g:, 'wiki_list_todos', ['TODO', 'DONE'])[0]
"     let l:search =  'rg --line-number --no-heading --smart-case -- '
"           \ . l:todo_string
"           \ . ' | sed "s/:[[:space:]]*[*|-] ' . l:todo_string . '[:]* /: /g"'

"     call fzf#run(fzf#wrap({
"           \'source': l:search,
"           \'dir': wiki#get_root(),
"           \'sink': funcref('s:accept_todo')
"           \}))

"   endfunction

"   command! WikiFzfTodos call Todos()

"   function! s:accept_todo(input) abort 
"     let [l:file, l:lnum; _] = split(a:input, ':')
"     execute 'edit ' . l:file
"     execute l:lnum
"   endfunction

"   nnoremap <silent> <plug>(wiki-fzf-todos) :WikiFzfTodos<cr>

"   nmap <leader>wtd <plug>(wiki-fzf-todos)
  nmap <leader>wl <plug>(wiki-journal-next)
  nmap <leader>wh <plug>(wiki-journal-prev)
  nmap <leader>wo <plug>(wiki-fzf-pages)
  nmap <leader>ws <plug>(wiki-journal-toweek)
  nmap <leader>wm <plug>(wiki-journal-tomonth)
  nmap <leader>wd <plug>(wiki-page-delete)
  
  let g:wiki_date_exe = 'gdate'
  " let g:wiki_journal = {
  "     \ 'frequency': 'weekly',
  "     \ 'date_format': {
  "     \   'weekly' : '%Y_w%V',
  "     \ },
  "     \}

  " liuchengxu/vim-which-key
  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

  " plasticboy/vim-markdown
  let g:vim_markdown_math = 1
  let g:vim_markdown_edit_url_in = 'hsplit'
  let g:vim_markdown_new_list_item_indent = 0 


  " flazz/vim-colorschemes
  colorscheme gruvbox
  set background=dark

  " tpope/vim-fugitive
  nmap <leader>gs :G<CR>
  nmap <leader>gn :diffget //3<CR>
  nmap <leader>gt :diffget //2<CR>

  " mbbill/undotree
  nmap <leader>u :UndotreeShow<CR>

  " vim-pandoc/vim-pandoc-syntax
  let g:pandoc#syntax#conceal#urls = 1
  let g:pandoc#modules#disabled = ["folding"]
  let g:pandoc#formatting#mode = 'ha'
  let g:pandoc_biblio_bibs = ["$HOME/Dropbox/notes/bibs/phd.md"]

  nmap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
  nmap <leader>f :resize 100<CR>

  " jpalardy/vim-slime
  let g:slime_target = "tmux"
  let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}






endif
