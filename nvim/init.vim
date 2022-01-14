" keymaps

filetype plugin on
set omnifunc=syntaxcomplete#Complete
set tabstop=4
set shiftwidth=4
set expandtab
set timeoutlen=400
inoremap <C-k> <C-x><C-o>
nnoremap <SPACE> <nop>
vnoremap <SPACE> <nop>
let mapleader=" "
let maplocalleader=" m"
let g:python3_host_prog='/home/david/anaconda3/bin/python'

lua require ('plugins')
lua require ('config')
lua require ('lsp')
lua require ('keymap')
lua require ('line')

au VimEnter * highlight link WhichKeyValue Question
colorscheme nord

if exists('g:started_by_firenvim')
    autocmd FocusLost * ++nested write
    autocmd InsertLeave * ++nested write
endif
