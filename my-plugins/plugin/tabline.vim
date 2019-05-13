
" ==============================================================================
" SETTINGS
" ==============================================================================

" Always display tab line
set showtabline=2


" ==============================================================================
" MY TABLINE
" ==============================================================================
" :help setting-tabline

highlight TabNumber ctermfg=LightGreen

function! MyTabLine()
	let str = ''

	" For each tab
	for i in range(tabpagenr('$'))

		" set the tab page number (for mouse clicks)
		let str .= '%'.(i+1).'T'

		" Label each window with MyTabLabel()
		"let str .= ' %#Error#%{MyTabLabel(' . (i + 1) . ')} '
		let str .= ' ' . MyTabLabel(i+1) . ' '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let str .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let str .= '%=%#TabLine#%999Xclose'
	endif

	return str
endf

function MyTabLabel(n)
	let l:buflist = tabpagebuflist(a:n)
	let l:winnr   = tabpagewinnr(a:n)
	let l:bufnum  = '%#TabNumber#[' . a:n . ']'
	let l:bufname  = bufname(l:buflist[l:winnr-1])

	" If selected tab
	if a:n == tabpagenr()
		let l:tabline = '%#TabLineSel#'
	else
		let l:tabline = '%#TabLine#'
	endif

	return l:bufnum . l:tabline . l:bufname
endfunction

set tabline=%!MyTabLine()

