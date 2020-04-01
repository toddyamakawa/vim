
" ==============================================================================
" LEADER
" ==============================================================================
" Space is the best leader because it does the same thing as 'l' in normal mode
let mapleader="\<space>"
let g:mapleader="\<space>"


" ==============================================================================
" COMMANDS
" ==============================================================================
" Save/quit
nnoremap <Leader>w :w!<Enter>
nnoremap <Leader>q :q!<Enter>
nnoremap <Leader>x :x!<Enter>

" Backup <Enter> key because <Enter> is mapped to :
nnoremap <Leader><Enter> <Enter>
vnoremap <Leader><Enter> <Enter>


" ==============================================================================
" MOVEMENT
" ==============================================================================

" My two favorite movment options, start/end of line
noremap H ^
noremap L $

" Move one line for wrapped text
noremap j gj
noremap k gk

" Mark with `M` and jump to mark with `m`
noremap M m
noremap m '

" Repeat latest f, t, F or T in opposite direction
" Opposite direction of ;
noremap : ,

" Disable arrow keys
"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
"inoremap <Up> <nop>
"inoremap <Down> <nop>
"inoremap <Left> <nop>
"inoremap <Right> <nop>


" ==============================================================================
" TABS
" ==============================================================================

" Open new tabs
cnoreabbrev tnew $tabnew %
cnoreabbrev tnewp exe "$tabnew " . system('xclip -o')
cnoreabbrev thelp tab help

" Close tab
cnoreabbrev td tabclose

" Move tabs
cnoreabbrev tmove tabmove
cnoreabbrev t0 tabmove 0
cnoreabbrev t$ tabmove $

" Switch tabs
nnoremap <silent><unique> > :tabnext<Enter>
nnoremap <silent><unique> < :tabprev<Enter>

" Jump tab
nnoremap <silent><unique> <space>1 1gt
nnoremap <silent><unique> <space>2 2gt
nnoremap <silent><unique> <space>3 3gt
nnoremap <silent><unique> <space>4 4gt
nnoremap <silent><unique> <space>5 5gt
nnoremap <silent><unique> <space>6 6gt
nnoremap <silent><unique> <space>7 7gt
nnoremap <silent><unique> <space>8 8gt
nnoremap <silent><unique> <space>9 9gt
nnoremap <silent><unique> <space>0 0gt

" Open in new tab
nnoremap <silent><unique>gt <C-w>gf
vnoremap <silent><unique>gt <C-w>gf


" ==============================================================================
" WINDOWS
" ==============================================================================

" Move between windows
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l

" Resize windows evenly
" No longer needed when using `lens.vim` plugin
nnoremap <Leader>= <C-w>=


" ==============================================================================
" BUFFER
" ==============================================================================
nnoremap <silent><unique><C-j> :bnext<cr>
nnoremap <silent><unique><C-k> :bprev<cr>


" ==============================================================================
" QUICKFIX/LOCATION
" ==============================================================================

" --- Quickfix List ---
nnoremap <silent><unique> gco :copen<Enter>
nnoremap <silent><unique> gcf :cfirst<Enter>
nnoremap <silent><unique> gcl :clast<Enter>
nnoremap <silent><unique> gcn :cnext<Enter>
nnoremap <silent><unique> gcp :cprev<Enter>
nnoremap <silent><unique> gcc :cclose<Enter>

" --- Location List ---
nnoremap <silent><unique> glo :lopen<Enter>
nnoremap <silent><unique> glf :lfirst<Enter>
nnoremap <silent><unique> gll :llast<Enter>
nnoremap <silent><unique> gln :lnext<Enter>
nnoremap <silent><unique> glp :lprev<Enter>
nnoremap <silent><unique> glc :lclose<Enter>


" ==============================================================================
" EDITING
" ==============================================================================

" Toggle expand tab
nnoremap <Leader><Tab> :set expandtab!<CR>

" Split up shell command into multiple lines
nnoremap <Leader>\ :s/\v\s+-/ \\\r\t-/g<Enter>

" TODO: Figure out how to run this in `vim-quickui` plugin
" Delete trailing whitespace
nnoremap <Leader>d$ :%s/\s\+$//g<Enter>
" Delete non-ASCII characters
nnoremap <Leader>dx :%s/[^\x00-\x7F]//g<Enter>
" Delete carriage returns
nnoremap <Leader>d<Enter> :%s/\r//g<Enter>


