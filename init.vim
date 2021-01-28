" load from ~/.vimrc
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" TODO: uncomment when neovim reaches 0.5
if has('nvim-0.5')
	lua require('lspconfig').pyls.setup{}
endif


