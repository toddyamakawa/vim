
" ==============================================================================
" VIM-QUICKUI PLUGIN
" ==============================================================================
" https://github.com/skywind3000/vim-quickui


" ==============================================================================
" SETTINGS
" ==============================================================================

" Open menu
noremap <C-o> :call quickui#menu#open()<cr>

" Colors
hi! QuickBG ctermfg=0 ctermbg=7 guifg=black guibg=gray
hi! QuickSel cterm=bold ctermfg=0 ctermbg=2 gui=bold guibg=brown guifg=gray
hi! QuickKey term=bold ctermfg=9 gui=bold guifg=#f92772
hi! QuickOff ctermfg=59 guifg=#75715e
hi! QuickHelp ctermfg=247 guifg=#959173


" ==============================================================================
" MENU
" ==============================================================================
call quickui#menu#reset()

" Options
call quickui#menu#install("&Options", [
		\ ['set &cursorline %{&cursorline? "off":"on"}', 'set cursorline!'],
		\ ['set &expandtab %{&expandtab? "off":"on"}',   'set expandtab!'],
		\ ['set &list %{&list? "off":"on"}',             'set list!'],
		\ ['set &paste %{&paste? "off":"on"}',           'set paste!'],
		\ ['set &spell %{&spell? "off":"on"}',           'set spell!']
	\ ])

" Help (weight=10000)
call quickui#menu#install('H&elp', [
		\ ["&Cheatsheet",      'help index', ''],
		\ ['T&ips',            'help tips', ''],
		\ ['--',               ''],
		\ ["&Tutorial",        'help tutor', ''],
		\ ['&Quick Reference', 'help quickref', ''],
		\ ['&Summary',         'help summary', ''],
	\ ],
	\ 10000)

