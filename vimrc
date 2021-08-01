
" ==============================================================================
" VIM-PLUG
" ==============================================================================

" --- Setup ---
set nocompatible
filetype off

" --- Vim Plugins ---
" :PlugInstall
call plug#begin('~/.vim/vim-plug')
	source ~/.vim/plug.vim
call plug#end()

" --- Enable Plugins ---
filetype indent plugin on

" --- .vim Directory ---
runtime ~/.vim

"let g:context_border_char = '▬'
let g:context_border_char = '-'


" ==============================================================================
" GENERAL SETTINGS
" ==============================================================================

" --- Command Line ---
" Use <Enter> for commmand mode
nnoremap <Enter> :
vnoremap <Enter> :

autocmd CmdwinEnter * nnoremap <buffer> <Enter> <Enter>
autocmd CmdwinEnter * nnoremap <buffer> q :q<Enter>

" --- Path ---
" Add subfolders to path
set path+=**

" Tab complete all matching files
set wildmenu

" --- Splits ---
set splitright
set splitbelow


" ==============================================================================
" BEAUTIFICATION
" ==============================================================================

" --- Color Schemes - --
"set term=xterm-256color
set t_Co=256

silent! colorscheme jellybeans " Favorite colorscheme
"silent! colorscheme codeschool
"silent! colorscheme molokai
"silent colorscheme vim-monokai-tasty

" Aurora settings
set termguicolors
set background=dark
silent! colorscheme aurora


"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"let &t_SI = "\<Esc>[6 q"
"let &t_SR = "\<Esc>[4 q"
"let &t_EI = "\<Esc>[2 q"

" Change background color beyond column 80
" TODO: https://github.com/jerodsanto/dotfiles/blob/8ced1bda82c0ffb302013432f7e92157176a5cc7/vimrc#L77
let &colorcolumn=join(range(81,999),",")
au InsertEnter * highlight ColorColumn guibg=#000000 ctermbg=16
au InsertLeave * highlight clear ColorColumn
"highlight clear ColorColumn


" ==============================================================================
" GENERAL SHORTCUTS
" ==============================================================================

" Automatically reload file
"set autoread

" TODO: Figure out how to unmap Shift-Backspace
"inoremap <S-BS> <nop>

nnoremap <F5> :edit<Enter>
nnoremap <S-F5> :edit!<Enter>

" Remap 'Undo' to 'U'
nnoremap U <C-r>

" Quickly replay a macro
nnoremap Q @q

set viminfo='20,\"50 " read/write a .viminfo file, don't store more than 50 lines of registers
set ruler            " show the cursor position all the time

" Automatically source .vimrc on save
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"set novisualbell
"set noerrorbells
set belloff=all


" ==============================================================================
" VISUAL MODE
" ==============================================================================

" Enter block visual mode with 'v'
" Or press 'vv' from normal mode
vnoremap v <C-v>

" Exit visual mode with 'q'
vnoremap q <Esc>


" ==============================================================================
" VIMDIFF
" ==============================================================================

" Update
nnoremap du :diffupdate<Enter>


" ==============================================================================
" CLIPBOARD
" ==============================================================================

" --- Set Clipboard ---
"set clipboard=xterm_clipboard
set clipboard=unnamed

" Higlight last inserted text
nmap gV `[v`]


" ==============================================================================
" NAVIGATION
" ==============================================================================

" Jump forward/backward
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

" Jump to definition
"nnoremap <C-k> <C-]>


" Disable lookup
noremap K <nop>


" Completion with C-j and C-k
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" --- Exit Insert Mode ---
inoremap jj <Esc>
inoremap kk <Esc>

" --- Search/Replace/Delete ---

let g:indexed_search_mappings = 0
" Default case-insensitive search
"nnoremap / :set ignorecase<Enter>/
"vnoremap / :set ignorecase<Enter>/

" Case-sensitive search
"nnoremap // :set noignorecase<Enter>/
"vnoremap // :set noignorecase<Enter>/
set ignorecase " Ignore case for searching
"set smartcase  " Ignore case if all lowercase, case-sensitive otherwise
"set hlsearch   " Highlight search matches (handled by vim-slash plugin)
set incsearch   " Show matches while typing

" Search for higlighted text
vnoremap * y/<C-R>"<CR>

" Delete matching rows
nnoremap d/ :g//d<Enter>
" REVISIT: Figure out how to use the blackhole register
" https://vim.fandom.com/wiki/Power_of_g
"nnoremap d/ :g//"_d<Enter>

" Replace matching words
nnoremap c/ :%s///g<Left><Left>

