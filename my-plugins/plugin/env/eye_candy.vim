
" Enable syntax highlighting
syntax on

" Terminal supports 256 colors
set t_Co=256

" Set character encoding
scriptencoding utf-8
set encoding=utf-8

" Show tab characters and off-screen text indicator
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" UTF-8 support
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
scriptencoding utf-8

set virtualedit=block
set number         " Show line number
set relativenumber " Show relative line number
set showmatch      " Show matching parantheses

" Highlight current line
"TODO: Make CursorLine change color for insert mode
set cursorline
"autocmd InsertEnter * highlight CursorLine guifg=something
"autocmd InsertLeave * highlight CursorLine guifg=something

" Favorite Windows gvim font
set guifont=consolas

