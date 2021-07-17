
" ==============================================================================
" CUSTOM FOLD METHODS
" ==============================================================================

let g:MyFoldHeader = '\v^\s*[#"] \={10,}'

function! MyFoldExpr(lnum)

	" Unused
	"let line = getline(a:lnum)
	"let nextline = getline(a:lnum + 1)
	"let prevline = getline(a:lnum - 1)

	" Header fold level
	if
		\    match(getline(a:lnum  ), g:MyFoldHeader) > -1
		\ && match(getline(a:lnum+2), g:MyFoldHeader) > -1

		return '>1'

	" Keep current fold level
	else
		return '='
	endif
endfunction


function! MyFoldText()
	let l:total_lines = printf('[%3d lines]', v:foldend-v:foldstart)

	" Get text from header
	if
		\    match(getline(v:foldstart  ), g:MyFoldHeader) > -1
		\ && match(getline(v:foldstart+2), g:MyFoldHeader) > -1
		let l:text = getline(v:foldstart + 1)

	" Get text from start of fold line
	else
		let l:text = getline(v:foldstart)
	endif

	let v:fillchars = ' '

	return v:folddashes . l:total_lines . l:text

endfunction


" ==============================================================================
" FOLDS SETTINGS
" ==============================================================================
setlocal foldmethod=expr
setlocal foldexpr=MyFoldExpr(v:lnum)
setlocal foldtext=MyFoldText()

" Only fold if there are more than 20 lines
set foldminlines=21

" Number of fold columns
set foldcolumn=3

