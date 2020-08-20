
" ==============================================================================
" FUNCTIONS
" ==============================================================================

" Highlight groups
function! StatuslineSetBG(bg)
	exec 'highlight StatusLine        ctermfg=249 ctermbg='.a:bg
	exec 'highlight StatusLineWhite   ctermfg=249 ctermbg='.a:bg
	exec 'highlight StatusLineRed     ctermfg=1   ctermbg='.a:bg
	exec 'highlight StatusLineGreen   ctermfg=2   ctermbg='.a:bg
	exec 'highlight StatusLineYellow  ctermfg=3   ctermbg='.a:bg
	exec 'highlight StatusLineBlue    ctermfg=4   ctermbg='.a:bg
	exec 'highlight StatusLineMagenta ctermfg=5   ctermbg='.a:bg
	exec 'highlight StatusLineCyan    ctermfg=6   ctermbg='.a:bg
endfunction

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
	"let l:filetype = "%{&filetype==''?'none':&filetype}"
	"let l:syntax = "%{&syntax==''?'none':&syntax}"
	let l:fileinfo = (a:width<80) ? '' : '[%{&fileencoding?&fileencoding:&encoding}.%{&fileformat}]'
	return l:fileinfo
endfunction


" ==============================================================================
" GENERATE STATUSLINE
" ==============================================================================

" Left
function! MyStatusLineLeft()
	let l:statusline = ''

	let l:default = '%#StatusLine#'
	let l:white   = '%#StatusLineWhite#'
	let l:red     = '%#StatusLineRed#'
	let l:green   = '%#StatusLineGreen#'
	let l:yellow  = '%#StatusLineYellow#'
	let l:blue    = '%#StatusLineBlue#'
	let l:magenta = '%#StatusLineMagenta#'
	let l:cyan    = '%#StatusLineCyan#'

	" Set mode if not normal mode
	let l:mode = mode()
	let l:statusline .= (l:mode=='n') ? '' : l:red.'['.l:mode.'-mode]'

	"let l:statusline .= &modified ? l:red : l:yellow " Red if modified
	"let l:statusline .= '[%{&readonly?"-":"%n"}]'
	let l:statusline .= l:yellow.'[%n]'.l:red.'%m'

	" relative/path/to/file
	let l:statusline .= l:white.'%f'

	" Return
	return l:statusline
endfunction

" Right
function! MyStatusLineRight(width)
	let l:statusline = ''

	let l:default = '%#StatusLine#'
	let l:white   = '%#StatusLineWhite#'
	let l:red     = '%#StatusLineRed#'
	let l:green   = '%#StatusLineGreen#'
	let l:yellow  = '%#StatusLineYellow#'
	let l:blue    = '%#StatusLineBlue#'
	let l:magenta = '%#StatusLineMagenta#'
	let l:cyan    = '%#StatusLineCyan#'

	" CurrentLine
	let l:statusline .= l:yellow.'%6l'
	" TotalLines
	let l:statusline .= l:white.'/%L,'
	" ColumnNumber
	let l:statusline .= l:yellow.'%-3c'
	" PercentFile
	let l:statusline .= l:white.'[%3p%%]'

	" TODO: Move filetype and syntax into StatuslineFileInfo
	let l:statusline .= l:green . '[%{&filetype==&syntax?'.
		\ '&filetype:'.
		\ '&filetype.".".&syntax}]'
	let l:statusline .= StatuslineFileInfo(a:width)

	" FileSize
	let l:statusline .= l:cyan.'[%{StatuslineFileSize()}]'

	" IndentStatus
	let l:statusline .= '[%{&expandtab?"s":"t"}%{&tabstop.&softtabstop.&shiftwidth}]'


	" Scroll statusbar
	if exists('g:loaded_scrollstatus')
		let l:statusline .= l:yellow.'[%{ScrollStatus()}]'
	endif

	" Return
	return l:statusline
endfunction


function! MyStatusLine(bufnr, bg, width)
	let l:statusline = ''

	let l:default = '%#StatusLine#'
	let l:white   = '%#StatusLineWhite#'
	let l:red     = '%#StatusLineRed#'
	let l:green   = '%#StatusLineGreen#'
	let l:yellow  = '%#StatusLineYellow#'
	let l:blue    = '%#StatusLineBlue#'
	let l:magenta = '%#StatusLineMagenta#'
	let l:cyan    = '%#StatusLineCyan#'

	call StatuslineSetBG(a:bg)

	try
		let l:statusline .= MyStatusLineLeft()
	catch
		let l:statusline .= l:red.'[FAILED] MyStatusLineLeft()'
	endtry
	let l:statusline .= l:white.'%='
	try
		let l:statusline .= MyStatusLineRight(a:width)
	catch
		let l:statusline .= l:red.'[FAILED] MyStatusLineRight()'
	endtry

	" Narrow-width indicator
	let l:statusline .= (a:width<80) ? l:red.'-' : ''

	return l:statusline
endfunction


" ==============================================================================
" SETTINGS
" ==============================================================================

" Always display
set laststatus=2

" Default color
call StatuslineSetBG(237)

" Clear
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

