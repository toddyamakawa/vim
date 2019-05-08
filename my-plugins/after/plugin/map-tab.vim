
if exists('g:loaded_my_map_tab')
  finish
endif
let g:loaded_my_map_tab = 1

" This plugin is in after to overwrite UltiSnips

" --- QuickFix Shortcuts ---
function TabQuickFix(dir)
	if bufname("%") =~ '^fugitive://'
		if a:dir == 'next'
			cnext
		elseif a:dir == 'prev'
			cprev
		endif
	else
		if a:dir == 'next'
			normal! >>
		elseif a:dir == 'prev'
			normal! <<
		endif
	endif
endfunction


" ==============================================================================
" KEY MAPPINGS
" ==============================================================================

" Press <Tab> in visual mode to indent
xnoremap <Tab> >gv
" Press <Shift-Tab> in visual mode to unindent
xnoremap <S-Tab> <gv

" <Tab> in normal mode to indent
nnoremap <Tab> :call TabQuickFix('next')<Enter>
" <Shift-Tab> in normal mode to unindent
nnoremap <S-Tab> :call TabQuickFix('prev')<Enter>

