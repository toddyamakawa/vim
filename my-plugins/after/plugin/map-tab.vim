
if exists('g:loaded_my_map_tab')
  finish
endif
let g:loaded_my_map_tab = 1


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

" Overwrite visual mode tab behavior from UltiSnips

" <Tab>/<S-Tab> to indent/unindent
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" <Tab>/<S-Tab> to indent/unindent
nnoremap <Tab> :call TabQuickFix('next')<Enter>
nnoremap <S-Tab> :call TabQuickFix('prev')<Enter>

" --- UltiSnips ---
" Restore ultisnips utility
" Mnemonic: Change-UltiSnip
xnoremap cu :call UltiSnips#SaveLastVisualSelection()<CR>gvs

