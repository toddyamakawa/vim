
" ==============================================================================
" SETTINGS
" ==============================================================================

" Always display tab line
set showtabline=2


" ==============================================================================
" MY TABLINE
" ==============================================================================
" :help setting-tabline

" --- Highlight Groups ---
highlight TabLine       ctermbg=0   ctermbg=239
highlight TabLineSel    ctermbg=0   ctermbg=249
highlight TabNumber     ctermfg=39  ctermbg=239
highlight TabNumberSel  ctermfg=239 ctermbg=39
highlight TabNumberM    ctermfg=9   ctermbg=239
highlight TabNumberSelM ctermfg=239 ctermbg=9

function! MyTabLine()
	let l:tabline = ''

	" Add Obsession indicator at the start
	if exists("g:loaded_obsession")
		let l:tabline .= '%#TabNumber#%{ObsessionStatus()} '
	endif

	" For each tab
	for i in range(tabpagenr('$'))

		" Label each window with MyTabLabel()
		let l:tabline .= MyTabLabel(i+1) . ' '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let l:tabline .= '%#TabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let l:tabline .= '%=%#TabLine#%999Xclose'
	endif

	return l:tabline
endf

function MyTabLabel(n)
	let l:buflist = tabpagebuflist(a:n)
	let l:winnr   = tabpagewinnr(a:n)
	let l:tabnum  = '%#TabNumber#[' . a:n . ']'
	"let l:bufname = bufname(l:buflist[l:winnr-1])
	let l:bufname = bufname(l:buflist[0])
	let l:bufbase = fnamemodify(l:bufname, ':t:r')

	" Set tab page number (for mouse clicks)
	let l:tabmouse = '%'.a:n.'T'

	" REVISIT: Check if any buffer is modified, not just current
	let l:mod = (getbufvar(buflist[l:winnr-1], "&mod") ? 'M' : '')

	" Check if tab selected
	let l:tabsel = (a:n == tabpagenr() ? 'Sel' : '')

	let l:tabline = '%#TabLine' . l:tabsel . '#'
	let l:tabnum  = '%#TabNumber' .l:tabsel . l:mod .'#[' . a:n . ']'

	return l:tabmouse . l:tabnum . l:tabline . l:bufbase
endfunction

set tabline=%!MyTabLine()

