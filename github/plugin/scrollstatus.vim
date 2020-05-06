
" https://github.com/ojroques/vim-scrollstatus/blob/master/plugin/scrollstatus.vim

" vim-scrollstatus
" Author: Oliver Roques

scriptencoding utf-8

if exists('g:loaded_scrollstatus') || &compatible
	finish
endif

let g:loaded_scrollstatus = v:true

let s:size = 20
let s:symbol_track = '░'
let s:symbol_bar = '█'

let s:numberLines = -1
let s:firstVisibleLine = -1
let s:lastVisibleLine = -1
let s:numberVisibleLines = -1

let s:binSize = 0
let s:binBarStart = 0
let s:barSize = 0

let s:scrollStatus = []

for i in range(s:size)
	call add(s:scrollStatus, s:symbol_track)
endfor

function! s:getBinSize(numberLines, containerSize) abort
	let l:binSize = float2nr(round(floor(a:numberLines) / a:containerSize))

	if l:binSize < 1
		return 1
	endif

	return l:binSize
endfunction

function! s:isSameNumberLines() abort
	return line('$') == s:numberLines
endfunction

function! s:isSameWindow() abort
	return line('w0') - 1 == s:firstVisibleLine &&
				\ line('w$') - 1 == s:lastVisibleLine
endfunction

function! s:fillBar(binBarStart, barSize, symbol) abort
	for i in range(a:binBarStart, a:binBarStart + a:barSize)
		if i > s:size - 1
			break
		endif

		let s:scrollStatus[i] = a:symbol
	endfor
endfunction

function! ScrollStatus() abort
	if s:size <= 0
		finish
	endif

	if line('w$') < line('w0')
		return join(s:scrollStatus, '')
	endif

	if s:isSameNumberLines() && s:isSameWindow()
		return join(s:scrollStatus, '')
	endif

	if !s:isSameNumberLines()
		let s:numberLines = line('$')
		let s:binSize = s:getBinSize(s:numberLines, s:size)
	endif

	if !s:isSameWindow()
		let s:firstVisibleLine = line('w0') - 1
		let s:lastVisibleLine = line('w$') - 1
		let s:numberVisibleLines = s:lastVisibleLine - s:firstVisibleLine + 1
	endif

	call s:fillBar(s:binBarStart, s:barSize, s:symbol_track)

	" Calculate start
	let s:binBarStart = s:firstVisibleLine / s:binSize
	if s:binBarStart > s:size -1
		let s:binBarStart = s:size - 1
	endif

	" Calculate bar size
	let s:barSize = float2nr(round(floor(s:numberVisibleLines * s:size) / s:numberLines))

	call s:fillBar(s:binBarStart, s:barSize, s:symbol_bar)

	return join(s:scrollStatus, '')
endfunction

