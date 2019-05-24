
" --- Always Display Status Line ---
set laststatus=2


" --- Highlight Groups ---
function! StatuslineSetBG(bg)
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


" File Info
" filetype, fileencoding, and fileformat
function! StatuslineFileInfo(width)
	let l:filetype = (&filetype=='') ? '%#StatusLineRed#[none' : '%#StatusLineGreen#[%{&filetype}'
	let l:fileinfo = (a:width<80) ? '' : '.%{&fileencoding?&fileencoding:&encoding}.%{&fileformat}'
	return l:filetype.l:fileinfo.']'
	"return '80'
endfunction



" ==============================================================================
" GENERATE STATUSLINE
" ==============================================================================
function! MyStatusLine(bufnr, bg, width)
	let l:statusline = ''

	let l:format  = '%#StatusLine'
	let l:default = '%#StatusLine#'
	let l:red     = '%#StatusLineRed#'
	let l:green   = '%#StatusLineGreen#'
	let l:yellow  = '%#StatusLineYellow#'
	let l:blue    = '%#StatusLineBlue#'
	let l:magenta = '%#StatusLineMagenta#'
	let l:cyan    = '%#StatusLineCyan#'

	call StatuslineSetBG(a:bg)


	" ==========================================================================
	" LEFT STATUSLINE
	" ==========================================================================

	let l:statusline .= &modified ? l:red : l:yellow " Red if modified
	"let l:statusline .= '%{&modified?'.l:red.':'.l:yellow.'}'
	let l:statusline .= &readonly ? '[-]' : '[%n]'

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

	" filetype, fileencoding, and fileformat
	let l:fileinfo = (a:width<80) ? '' : '.%{&fileencoding?&fileencoding:&encoding}.%{&fileformat}'

	" FIXME: Uses current flags, not local
	"let l:filetype = (&filetype=='') ? l:red.'[none' : l:green.'[%{&filetype}'
	"let l:statusline .= l:filetype.l:fileinfo.']'

	" Use this for now
	let l:filetype = "%{&filetype==''?'none':&filetype}"
	let l:statusline .= l:green.'['.l:filetype.l:fileinfo.']'

	" REVISIT: FIgure out how to make this work
	"let l:statusline .= '%{StatuslineFileInfo('.a:width.')}'

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

	" Width to narrow indicator
	let l:statusline .= (a:width<80) ? l:format.'Red#-' : ''

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


