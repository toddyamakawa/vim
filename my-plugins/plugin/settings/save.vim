
" --- History ---
" Save 1000 command lines of history
set history=1000


" --- Backup ---
" No backup file (defaults to .filename~)
set nobackup


" --- Swap ---
set swapfile directory=$HOME/.vim-swap// " store all swap files here
if !isdirectory(&directory)
	call mkdir(&directory, 'p', 0700)
endif


" --- Undo ---
if has('persistent_undo')
	set undofile undodir=$HOME/.vim-undo//
	if !isdirectory(&undodir)
		call mkdir(&undodir,   'p', 0700)
	endif
endif


" --- View ---
" Currently using Obsession plugin
" Ran into issues with certain highlight groups breaking
"set viewoptions=cursor,folds,options
"set viewdir=~/.vim/.view//
"augroup automatic_view
	"autocmd!
	"autocmd BufWinLeave * silent! mkview
	"autocmd BufWinEnter * silent! loadview
"augroup END

