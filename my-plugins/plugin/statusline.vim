
" --- Always Display Status Line ---
set laststatus=2


" --- Highlight Groups ---
function! StatuslineSetBG(bg)
	"let l:buflist = tabpagebuflist(a:n)
	exec 'highlight StatusLine        ctermfg=249 ctermbg='.a:bg
	exec 'highlight StatusLineRed     ctermfg=1   ctermbg='.a:bg
	exec 'highlight StatusLineGreen   ctermfg=2   ctermbg='.a:bg
	exec 'highlight StatusLineYellow  ctermfg=3   ctermbg='.a:bg
	exec 'highlight StatusLineBlue    ctermfg=4   ctermbg='.a:bg
	exec 'highlight StatusLineMagenta ctermfg=5   ctermbg='.a:bg
	exec 'highlight StatusLineCyan    ctermfg=6   ctermbg='.a:bg
endfunction

" Default color
call StatuslineSetBG(237)

autocmd InsertEnter * call StatuslineSetBG(17)
autocmd InsertLeave * call StatuslineSetBG(237)
if v:version > 800
	autocmd CmdlineEnter * call StatuslineSetBG(22)
	autocmd CmdlineLeave * call StatuslineSetBG(237)
endif
" FIXME: Turns out highlights are global
"autocmd WinEnter * call StatuslineSetBG(237)
"autocmd WinLeave * call StatuslineSetBG(248)


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
function! MyStatusLine()
	let l:statusline = ''

	" ==========================================================================
	" LEFT STATUSLINE
	" ==========================================================================

	" Buffer number
	let l:bufnum_color = 'Yellow'
	let l:statusline .= '%#StatusLine'.l:bufnum_color.'#[%n]'

	" Modified?
	let l:statusline .= '%#StatusLineRed#%m'

	" relative/path/to/file
	let l:statusline .= '%#StatusLine#%f'

	" ==========================================================================
	" RIGHT STATUSLINE
	" ==========================================================================
	let l:statusline .= '%#StatusLine#%='

	" CurrentLine
	let l:statusline .= '%#StatusLineYellow#%6l'

	" TotalLines
	let l:statusline .= '%#StatusLine#/%L,'

	" ColumnNumber
	let l:statusline .= '%#StatusLineYellow#%-3c'

	" PercentFile
	let l:statusline .= '%#StatusLine#[%3p%%]'

	" FileType
	let l:statusline .= '%#StatusLineGreen#%y'

	" FileSize
	let l:statusline .= '%#StatusLineCyan#[%{StatuslineFileSize()}]'

	" IndentStatus
	if &expandtab
		let l:expandtab_color = 'cyan'
	else
		let l:expandtab_color = 'blue'
	endif
	let l:statusline .= '%#StatusLine'.l:expandtab_color.'#'
	let l:statusline .= '[%{&tabstop.&softtabstop.&shiftwidth}]'

	return l:statusline
endfunction


set statusline=%!MyStatusLine()

