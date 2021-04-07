" set leader TODO
let g:mapleader = "\<Space>"

" netrw / vim-vinegar
" nnoremap <silent> <Leader>ev :Vexplore
nnoremap <silent> <Leader>e :Lexplore<CR>

" nvim-lspconfig
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [d <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" fzf.vim
" junegunn/fzf
nnoremap <silent> <Leader>ft :Rg <C-R>=("TODO")<CR><CR> 
nnoremap <silent> <Leader>fw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <Leader>ff :Rg <C-R><CR><CR>
" nnoremap <silent> <Leader>f :Rg <C-R><C-W><CR>

" notational-fzf-vim
nnoremap <silent> <Leader>zf :NV<CR>
nnoremap <silent> <Leader>zs :NV <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <Leader>zg :NV <C-R>=("}}")<CR><CR>
nnoremap <silent> <Leader>zt :NV <C-R>=("!!")<CR><CR>
nnoremap <silent> <Leader>zc :NV <C-R>=("~~")<CR><CR>
" dirty nasty disgusting way of making a new file 
nnoremap <silent> <Leader>zn :e <C-R>=fnameescape(g:nv_main_directory . '/' . strftime("%Y%m%d%H%M") . '.md')<CR><CR> #<space>


" vim-which-key
" TODO: work these examples into something I can use


" " Create map to add keys to
" let g:which_key_map =  {}
" " Define a separator
" let g:which_key_sep = '→'
" " Floating windows aren't great for this
" " let g:which_key_use_floating_win = 0
" let g:which_key_max_size = 0


" " Single mappings
" let g:which_key_map['/'] = [ ':call Comment()'                                 , 'comment' ]
" let g:which_key_map['.'] = [ ':e $MYVIMRC'                                     , 'open init' ]
" let g:which_key_map['='] = [ '<C-W>='                                          , 'balance windows' ]
" let g:which_key_map['e'] = [ ':NvimTreeToggle'                                 , 'explorer' ]
" let g:which_key_map['n'] = [ ':let @/ = ""'                                    , 'no highlight' ]
" let g:which_key_map['o'] = [ ':RnvimrToggle'                                   , 'open' ]
" let g:which_key_map['r'] = [ ':SlimeSend'                                      , 'send section to REPL' ]
" let g:which_key_map['z'] = [ 'Goyo'                                            , 'zen' ]


" " a is for actions
" let g:which_key_map.a = {
"       \ 'name' : '+actions' ,
"       \ 'c' : [':ColorizerToggle'        , 'colorizer'],
"       \ 'e' : [':CocCommand explorer'    , 'explorer'],
"       \ 'h' : [':let @/ = ""'            , 'remove search highlight'],
"       \ 'l' : [':Bracey'                 , 'start live server'],
"       \ 'L' : [':BraceyStop'             , 'stop live server'],
"       \ 'm' : [':MarkdownPreview'        , 'markdown preview'],
"       \ 'M' : [':MarkdownPreviewStop'    , 'markdown preview stop'],
"       \ 'n' : [':set nonumber!'          , 'line-numbers'],
"       \ 's' : [':s/\%V\(.*\)\%V/"\1"/'   , 'surround'],
"       \ 'r' : [':set norelativenumber!'  , 'relative line nums'],
"       \ 't' : [':FloatermToggle'         , 'terminal'],
"       \ 'v' : [':Codi'                   , 'virtual repl on'],
"       \ 'V' : [':Codi!'                  , 'virtual repl off'],
"       \ 'w' : [':StripWhitespace'        , 'strip whitespace'],
"       \ }

