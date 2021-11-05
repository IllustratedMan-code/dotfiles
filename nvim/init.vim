" keymaps

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set tabstop=4
set shiftwidth=4
set timeoutlen=400
inoremap <C-k> <C-x><C-o>
nnoremap <SPACE> <Nop>
let mapleader=" "

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
" Initialize plugin system
call plug#end()

lua require ('plugins')
lua require ('config')
lua require ('lsp')
lua require ('keymap')
lua require ('line')


