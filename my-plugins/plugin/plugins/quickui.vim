
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
hi! QuickBG   ctermfg=251 ctermbg=239
hi! QuickSel  cterm=bold ctermfg=239 ctermbg=251
hi! QuickKey  cterm=bold ctermfg=39
hi! QuickOff  ctermfg=59
hi! QuickHelp ctermfg=247


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
		\ ['Open &Buffer', 'call quickui#tools#list_buffer(''tabedit'')'],
		\ ['--',           ''],
		\ ['New &Tab',     '$tabnew %'],
		\ ['&Close Tab',   'tabclose']
	\ ])

" Edit
"call quickui#menu#install("&Edit", [
		"\ ['Delete matching lines', 'exec "normal :g//d\<CR>"']
	"\ ])

" Plugins
call quickui#menu#install("&Plugins", [
		\ ['&ANSI',                'AnsiEsc'],
		\ ['ALE',                  'ALEToggle'],
		\ ['&Rainbow Indentation', 'RainbowLevelsToggle'],
		\ ['&UltiSnips Edit',      'UltiSnipsEdit'],
		\ ['UltiSnips &List',      'call UltiSnips#ListSnippets()'],
		\ ['&Xterm Color Table',   'XtermColorTable']
	\ ])

" File types
call quickui#menu#install("&Type", [
		\ ['log', 'set ft=log syntax=log'],
		\ ['&verilog', 'setfiletype verilog_systemverilog']
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

