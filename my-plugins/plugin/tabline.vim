
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
" HACK: Rename TabLine highlight groups
execute 'highlight! MyTabLine       ctermfg=249 ctermbg=239'
execute 'highlight! MyTabLineSel    ctermfg=232 ctermbg=249'
execute 'highlight! MyTabNumber     ctermfg=39  ctermbg=239'
execute 'highlight! MyTabNumberSel  ctermfg=239 ctermbg=39'
execute 'highlight! MyTabNumberM    ctermfg=9   ctermbg=239'
execute 'highlight! MyTabNumberSelM ctermfg=239 ctermbg=9'
execute 'highlight! MyTabLineFill   ctermfg=103 ctermbg=103 term=reverse guifg=#9098a0'

function! MyTabLine()
	let l:tabline = ''

	" Add Obsession indicator at the start
	if exists("g:loaded_obsession")
		let l:tabline .= '%#MyTabNumber#%{ObsessionStatus()} '
	endif

	" For each tab
	for i in range(tabpagenr('$'))

		" Label each window with MyTabLabel()
		let l:tabline .= MyTabLabel(i+1) . ' '
	endfor

	" after the last tab fill with TabLineFill and reset tab page nr
	let l:tabline .= '%#MyTabLineFill#%T'

	" right-align the label to close the current tab page
	if tabpagenr('$') > 1
		let l:tabline .= '%=%#MyTabLine#%999Xclose'
	endif

	return l:tabline
endf

function MyTabLabel(n)
	let l:buflist = tabpagebuflist(a:n)
	let l:winnr   = tabpagewinnr(a:n)

	" Get buffername
	let l:bufname = bufname(l:buflist[0])
	if l:bufname == '<context.vim>'
		if len(l:buflist) > 1
			let l:bufname = bufname(l:buflist[1])
		else
			let l:bufname = '<context>'
		end
	endif
	let l:bufbase = fnamemodify(l:bufname, ':t:r')

	" Set tab page number (for mouse clicks)
	let l:tabmouse = '%'.a:n.'T'

	" REVISIT: Check if any buffer is modified, not just current
	let l:mod = (getbufvar(buflist[l:winnr-1], "&mod") ? 'M' : '')

	" Check if tab selected
	let l:tabsel = (a:n == tabpagenr() ? 'Sel' : '')

	let l:tabline = '%#MyTabLine' . l:tabsel . '#'
	let l:tabnum  = '%#MyTabNumber' .l:tabsel . l:mod .'#[' . a:n . ']'

	return l:tabmouse . l:tabnum . l:tabline . l:bufbase
endfunction

set tabline=%!MyTabLine()

