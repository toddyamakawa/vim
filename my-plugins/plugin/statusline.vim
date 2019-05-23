
" --- Always Display Status Line ---
set laststatus=2


" --- Highlight Groups ---
function! StatuslineSetBG(bufnr, bg)
	exec 'highlight StatusLine'.a:bufnr.'        ctermfg=249 ctermbg='.a:bg
	exec 'highlight StatusLine'.a:bufnr.'Red     ctermfg=1   ctermbg='.a:bg
	exec 'highlight StatusLine'.a:bufnr.'Green   ctermfg=2   ctermbg='.a:bg
	exec 'highlight StatusLine'.a:bufnr.'Yellow  ctermfg=3   ctermbg='.a:bg
	exec 'highlight StatusLine'.a:bufnr.'Blue    ctermfg=4   ctermbg='.a:bg
	exec 'highlight StatusLine'.a:bufnr.'Magenta ctermfg=5   ctermbg='.a:bg
	exec 'highlight StatusLine'.a:bufnr.'Cyan    ctermfg=6   ctermbg='.a:bg
endfunction

" Default color
call StatuslineSetBG(bufnr('%'),237)

" --- User-Definend Colors ---

" REVISIT: Implement in new function
" White on Blue if Insert Mode
" White on Black if not Insert Mode
"hi User9 ctermfg=7 ctermbg=0
"autocmd InsertEnter * hi User9 ctermfg=7 ctermbg=6
"autocmd InsertLeave * hi User9 ctermfg=7 ctermbg=0
"if v:version > 800
	"autocmd CmdlineEnter * hi User9 ctermfg=7 ctermbg=5
	"autocmd CmdlineLeave * hi User9 ctermfg=7 ctermbg=0
"endif


" File Size
function! StatuslineFileSize()
	let l:bytes = getfsize(expand("%"))
	if l:bytes > 1073741824
		return printf("%.1fG", l:bytes/1073741824.0)
	elseif l:bytes > 1048576
		return printf("%.1fM", l:bytes/1048576.0)
	elseif bytes > 1024
		return printf("%.1fk", l:bytes/1024.0)
	endif
	return l:bytes
endfunction



" ==============================================================================
" GENERATE STATUSLINE
" ==============================================================================
function! MyStatusLine(bufnr, bg, width)
	let l:statusline = ''
	let l:format = '%#StatusLine'.a:bufnr

	call StatuslineSetBG(a:bufnr, a:bg)

	" ==========================================================================
	" LEFT STATUSLINE
	" ==========================================================================

	" Buffer number
	let l:bufnum_color = 'Yellow'
	let l:statusline .= l:format.l:bufnum_color.'#[%n]'

	" Modified?
	let l:statusline .= l:format.'Red#%m'

	" relative/path/to/file
	let l:statusline .= l:format.'#%f'

	" ==========================================================================
	" RIGHT STATUSLINE
	" ==========================================================================
	let l:statusline .= l:format.'#%='

	" CurrentLine
	let l:statusline .= l:format.'Yellow#%6l'

	" TotalLines
	let l:statusline .= l:format.'#/%L,'

	" ColumnNumber
	let l:statusline .= l:format.'Yellow#%-3c'

	" PercentFile
	let l:statusline .= l:format.'#[%3p%%]'

	" FileType
	let l:statusline .= l:format.'Green#%y'

	" FileSize
	let l:statusline .= l:format.'Cyan#[%{StatuslineFileSize()}]'

	" IndentStatus
	if &expandtab
		let l:expandtab_color = 'cyan'
	else
		let l:expandtab_color = 'blue'
	endif
	let l:statusline .= l:format.l:expandtab_color.'#'
	let l:statusline .= '[%{&tabstop.&softtabstop.&shiftwidth}]'

	return l:statusline
endfunction

set statusline=
augroup MyStatusLine
	" Set statusline, pass buffer number and window width
	autocmd!
	autocmd BufWinEnter,WinEnter * setlocal statusline=%!MyStatusLine(bufnr('%'),238,winwidth(win_id2win(win_getid())))
	autocmd WinLeave             * setlocal statusline=%!MyStatusLine(bufnr('%'),235,winwidth(win_id2win(win_getid())))
	autocmd InsertEnter          * setlocal statusline=%!MyStatusLine(bufnr('%'),17,winwidth(win_id2win(win_getid())))
	autocmd InsertLeave          * setlocal statusline=%!MyStatusLine(bufnr('%'),238,winwidth(win_id2win(win_getid())))
	if v:version > 800
		autocmd CmdlineLeave * setlocal statusline=%!MyStatusLine(bufnr('%'),238,winwidth(win_id2win(win_getid())))
		autocmd CmdlineEnter * setlocal statusline=%!MyStatusLine(bufnr('%'),235,winwidth(win_id2win(win_getid())))
	endif
augroup END


