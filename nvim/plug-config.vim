" ~~ Plugin configuration ~~

" vim-vinegar
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'

" vim-sensible

" vim-commentary

" vim-rooter
let g:rooter_silent_chdir = 1

" vim-startify
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:startify_bookmarks = [
			\ '~/git/github.com/harritaylor/',
			\]
" goyo.vim

" TODO: vim-snippets

" TODO: emmet-vim

" vim-which-key
let g:which_key_timeout = 100

let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Map leader to which_key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

" " Create map to add keys to
" let g:which_key_map =  {}
" " Define a separator
" let g:which_key_sep = '→'
" " Floating windows aren't great for this
" let g:which_key_use_floating_win = 0
" let g:which_key_max_size = 0

" " Hide status line
" autocmd! FileType which_key
" autocmd  FileType which_key set laststatus=0 noshowmode noruler
"   \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

" nvim-treesitter

" nvim-spconfig
" configured in LUA file 

" nvim-compe

" fzf.vim

" notational-fzf-vim
let g:nv_search_paths = ["~/Dropbox/notes"]
let g:nv_main_directory = "~/Dropbox/notes"

" vim-colorschemes

" vim-tmux-navigator

" vim-slime

" undotree

" vim-polyglot

" vim-easymotion

" vim-gitgutter

" vim-fugitive

" gv.vim

" git-messenger.vim


