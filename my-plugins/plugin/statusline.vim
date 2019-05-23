
" --- Always Display Status Line ---
set laststatus=2


" --- Highlight Groups ---
highlight StatusLine              ctermfg=249 ctermbg=239
highlight StatusLineActive        ctermfg=249 ctermbg=237
highlight StatusLineRed           ctermfg=1   ctermbg=239
highlight StatusLineRedActive     ctermfg=1   ctermbg=237
highlight StatusLineGreen         ctermfg=2   ctermbg=239
highlight StatusLineGreenActive   ctermfg=2   ctermbg=237
highlight StatusLineYellow        ctermfg=3   ctermbg=239
highlight StatusLineYellowActive  ctermfg=3   ctermbg=237
highlight StatusLineBlue          ctermfg=4   ctermbg=239
highlight StatusLineBlueActive    ctermfg=4   ctermbg=237
highlight StatusLineMagenta       ctermfg=5   ctermbg=239
highlight StatusLineMagentaActive ctermfg=5   ctermbg=237
highlight StatusLineCyan          ctermfg=6   ctermbg=239
highlight StatusLineCyanActive    ctermfg=6   ctermbg=237


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

	" TODO: Figure out how to determine if active
	let l:active = 'Active'

	" Buffer number
	let l:bufnum_color = 'Yellow'
	let l:statusline .= '%#StatusLine'.l:bufnum_color.l:active.'#[%n]'

	" Modified?
	let l:statusline .= '%#StatusLineRed'.l:active.'#%m'

	" relative/path/to/file
	let l:statusline .= '%#StatusLine'.l:active.'#%f'

	" ==============================================================================
	" RIGHT STATUSLINE
	" ==============================================================================
	let l:statusline .= '%#StatusLine'.l:active.'#%='

	" CurrentLine
	let l:statusline .= '%#StatusLineYellow'.l:active.'#%6l'

	" TotalLines
	let l:statusline .= '%#StatusLine'.l:active.'#/%L,'

	" ColumnNumber
	let l:statusline .= '%#StatusLineYellow'.l:active.'#%-3c'

	" PercentFile
	let l:statusline .= '%#StatusLine'.l:active.'#[%3p%%]'

	" FileType
	let l:statusline .= '%#StatusLineGreen'.l:active.'#%y'

	" FileSize
	let l:statusline .= '%#StatusLineCyan'.l:active.'#[%{StatuslineFileSize()}]'

	" IndentStatus
	if &expandtab
		let l:expandtab_color = 'cyan'
	else
		let l:expandtab_color = 'blue'
	endif
	let l:statusline .= '%#StatusLine'.l:expandtab_color.l:active.'#'
	let l:statusline .= '[%{&tabstop.&softtabstop.&shiftwidth}]'

	return l:statusline
endfunction


set statusline=%!MyStatusLine()

