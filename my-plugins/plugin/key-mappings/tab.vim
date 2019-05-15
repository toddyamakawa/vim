
" ==============================================================================
" COMMANDS
" ==============================================================================

" Open new tabs
cnoreabbrev tnew $tabnew %
cnoreabbrev tnewp exe "$tabnew " . system('xclip -o')
cnoreabbrev thelp tab help

" Close tab
cnoreabbrev td tabclose

" Move tabs
cnoreabbrev tmove tabmove
cnoreabbrev t0 tabmove 0
cnoreabbrev t$ tabmove $



" ==============================================================================
" KEY MAPPINGS
" ==============================================================================

" Switch tabs
nnoremap <silent><unique> > :tabnext<Enter>
nnoremap <silent><unique> < :tabprev<Enter>

" Jump tab
nnoremap <silent><unique> <space>1 1gt
nnoremap <silent><unique> <space>2 2gt
nnoremap <silent><unique> <space>3 3gt
nnoremap <silent><unique> <space>4 4gt
nnoremap <silent><unique> <space>5 5gt
nnoremap <silent><unique> <space>6 6gt
nnoremap <silent><unique> <space>7 7gt
nnoremap <silent><unique> <space>8 8gt
nnoremap <silent><unique> <space>9 9gt
nnoremap <silent><unique> <space>0 0gt

" Open in new tab
nnoremap <silent><unique>gt <C-w>gf
vnoremap <silent><unique>gt <C-w>gf

