
" --- Always Display Status Line ---
set laststatus=2


" --- User-Definend Colors ---

" White on Black
hi User1 ctermfg=7 ctermbg=0

" Green on Black
hi User2 ctermfg=2 ctermbg=0

" Yellow on Black
hi User3 ctermfg=3 ctermbg=0

" Red on Black
hi User4 ctermfg=1 ctermbg=0

" Blue on Black
hi User5 ctermfg=6 ctermbg=0

" Purple on Black if ExpandTab
" Blue on Black if NoExpandTab
if &expandtab | hi User8 ctermfg=13 ctermbg=0 | else | hi User8 ctermfg=12 ctermbg=0 | endif
autocmd OptionSet expandtab if &expandtab | hi User8 ctermfg=13 ctermbg=0 | else | hi User8 ctermfg=12 ctermbg=0 | endif


" White on Blue if Insert Mode
" White on Black if not Insert Mode
hi User9 ctermfg=7 ctermbg=0
autocmd InsertEnter * hi User9 ctermfg=7 ctermbg=6
autocmd InsertLeave * hi User9 ctermfg=7 ctermbg=0
if v:version > 800
	autocmd CmdlineEnter * hi User9 ctermfg=7 ctermbg=5
	autocmd CmdlineLeave * hi User9 ctermfg=7 ctermbg=0
endif


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



function! MyStatusLine()
	let l:statusline = ''

	" ==============================================================================
	" LEFT STATUSLINE
	" ==============================================================================

	" Buffer number
	let l:statusline .= '%3*[%n]'
	"return l:statusline

	" Modified?
	let l:statusline .= '%4*%m'

	" relative/path/to/file
	let l:statusline .= '%9*%f'

	" ==============================================================================
	" RIGHT STATUSLINE
	" ==============================================================================
	let l:statusline .= '%1*%='

	" CurrentLine/TotalLines
	let l:statusline .= '%3*%6l%1*/%L'

	" ColumnNumber
	let l:statusline .= ',%3*%-3c'

	" PercentFile
	let l:statusline .= '%1*[%3p%%]'

	" FileType
	let l:statusline .= '%2*%y'

	" IndentStatus
	let l:statusline .= '%8*[%{&tabstop.&softtabstop.&shiftwidth}]'

	return l:statusline

endfunction


set statusline=%!MyStatusLine()

