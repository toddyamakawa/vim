
" ==============================================================================
" VIM-QUICKUI PLUGIN
" ==============================================================================
" https://github.com/skywind3000/vim-quickui

" Check Vim version
if v:version < 802
	finish
endif

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

" Check plugin
try
	call quickui#menu#reset()
catch
	finish
endtry

" File
call quickui#menu#install("&File", [
		\ ['Open &buffer', 'call quickui#tools#list_buffer(''tabedit'')']
	\ ])

call quickui#menu#install("&Type", [
		\ ['log', 'set ft=log syntax=log'],
		\ ['verilog', 'setfiletype verilog_systemverilog']
	\ ])

" Options
call quickui#menu#install("&Options", [
		\ ['set &cursorline %{&cursorline? "off":"on"}', 'set cursorline!'],
		\ ['set &expandtab %{&expandtab? "off":"on"}',   'set expandtab!'],
		\ ['set &list %{&list? "off":"on"}',             'set list!'],
		\ ['set &paste %{&paste? "off":"on"}',           'set paste!'],
		\ ['set &spell %{&spell? "off":"on"}',           'set spell!'],
		\ ['set tabwidth=&2',                            'set ts=2 sts=0 sts=0'],
		\ ['set tabwidth=&4',                            'set ts=4 sts=0 sts=0'],
		\ ['set tabwidth=&8',                            'set ts=8 sts=0 sts=0'],
		\ ['set &wrap %{&wrap? "off":"on"}',             'set wrap!']
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

