
" ==============================================================================
" SETTINGS
" ==============================================================================

" Always display tab line
set showtabline=2


" ==============================================================================
" MY TABLINE
" ==============================================================================
" :help setting-tabline

" --- Colors ---
let s:tabline_fg      = ' ctermbg=0'
let s:tabline_bg      = ' ctermbg=239'
let s:tablinesel_fg   = ' ctermbg=0'
let s:tablinesel_bg   = ' ctermbg=249'

let s:tabnumber_fg    = ' ctermfg=39'
let s:tabnumber_bg    = ' ctermbg=239'
let s:tabnumbersel_fg = ' ctermfg=239'
let s:tabnumbersel_bg = ' ctermbg=39'

" --- Highlight Groups ---
exe 'highlight TabLine   ' . s:tabline_fg    . s:tabline_bg
exe 'highlight TabLineSel' . s:tablinesel_fg . s:tablinesel_bg

exe 'highlight TabNumber   ' . s:tabnumber_fg    . s:tabnumber_bg
exe 'highlight TabNumberSel' . s:tabnumbersel_fg . s:tabnumbersel_bg

function! MyTabLine()
	let str = ''

	" For each tab
	for i in range(tabpagenr('$'))


		" Label each window with MyTabLabel()
		"let str .= ' %#Error#%{MyTabLabel(' . (i + 1) . ')} '
		let str .= MyTabLabel(i+1) . ' '
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
	let l:bufname = bufname(l:buflist[l:winnr-1])
	let l:bufbase = fnamemodify(l:bufname, ':t:r')

	" Set tab page number (for mouse clicks)
	let l:bufmouse = '%'.a:n.'T'

	" Check if tab selected
	if a:n == tabpagenr()
		let l:tabline = '%#TabLineSel#'
		let l:bufnum  = '%#TabNumberSel#[' . a:n . ']'
	else
		let l:tabline = '%#TabLine#'
		let l:bufnum  = '%#TabNumber#[' . a:n . ']'
	endif

	return l:bufmouse . l:bufnum . l:tabline . l:bufbase
endfunction

set tabline=%!MyTabLine()

