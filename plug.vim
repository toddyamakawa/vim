
" https://vim.fandom.com/wiki/Unused_keys

" ==============================================================================
" MOVEMENT
" ==============================================================================

" --- vim-vertical-move ---
" :help vertical-move
" Maps {count} [v and v| to jump up/down as many lines as possible
" Preserves cursor column
Plug 'vim-utils/vim-vertical-move'

" --- vim-JumpToVerticalOccurrence ---
" :help JumpToVerticalOccurrence-usage
" Maps {count} [| and ]| to jump to previous/next non-whitespace line
" Preserves cursor column
Plug 'inkarkat/vim-JumpToVerticalOccurrence'

" Unmap conflicts with vim-vertical-move plugin
let g:JumpToVerticalOccurrence_CharUnderCursorMapping = ''
let g:JumpToVerticalOccurrence_QueriedMapping = ''

" --- vim-indentwise ---
" :help indentwise
" Maps {count} [- [+ [= ]= ]+ ]- to jump to lesser/greater/equal indentation
" {count}[_  {count}]_ jump to previous/next line with indent-level of {count}.
Plug 'jeetsukumaran/vim-indentwise'

" --- vim-easymotion ---
" :help easymotion
Plug 'easymotion/vim-easymotion'

"let g:EasyMotion_keys='1234567890hklyuiopnm,qwertzxcvbasdgjf;'

nmap <silent><unique> ;t <Plug>(easymotion-t)
nmap <silent><unique> ;T <Plug>(easymotion-T)
nmap <silent><unique> ;f <Plug>(easymotion-f)
nmap <silent><unique> ;F <Plug>(easymotion-F)
nmap <silent><unique> ;n <Plug>(easymotion-n)
nmap <silent><unique> ;N <Plug>(easymotion-N)
nmap <silent><unique> ;s <Plug>(easymotion-s)

let g:EasyMotion_startofline = 0
nmap <silent><unique> ;j <Plug>(easymotion-sol-j)
nmap <silent><unique> ;k <Plug>(easymotion-sol-k)
vmap <silent><unique> ;j <Plug>(easymotion-j)
vmap <silent><unique> ;k <Plug>(easymotion-k)



" ==============================================================================
" INTERFACE
" ==============================================================================

" --- Color Schemes ---
"Plug 'qualiabyte/vim-colorstepper'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'antlypls/vim-colors-codeschool'
Plug 'patstockwell/vim-monokai-tasty'

" --- Clipboard ---
" TODO: Figure out this plugin
" https://github.com/kana/vim-fakeclip
" Plug 'kana/vim-fakeclip'

" --- Indentation ---
Plug 'yggdroot/indentline'

" Reset IndentLines when tabstop changes
autocmd OptionSet tabstop IndentLinesReset
autocmd OptionSet tabstop set sts=0 sw=0

" Show spaces for indentation
let g:indentLine_char = '|'

" --- Rainbow Indentation ---
"Plug 'thiagoalessio/rainbow_levels.vim', { 'on': 'RainbowLevelsToggle' }
Plug 'thiagoalessio/rainbow_levels.vim'
cnoreabbrev rain RainbowLevelsToggle

"Plug 'nathanaelkane/vim-indent-guides.git'
"Plug 'tpope/vim-sleuth'

" --- fzf ---
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

let g:fzf_action = {
	\ 'ctrl-o': 'tab split',
	\ 'ctrl-n': 'tab split',
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
\ }


" --- ANSI Escape Syntax ---
Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
cnoreabbrev ansi AnsiEsc


" ==============================================================================
" INTEGRATION
" ==============================================================================

" --- UltiSnips ---
" :help snippet
Plug 'SirVer/ultisnips'
cnoreabbrev ultie  UltiSnipsEdit
cnoreabbrev ultift UltiSnipsAddFiletypes

" Trigger configuration
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsListSnippets        = "<F2>"
let g:UltiSnipsJumpForwardTrigger  = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

" Directory configuration
let g:UltiSnipsSnippetsDir        = '~/.vim/ultisnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips', 'ultisnips']
let g:UltiSnipsEditSplit          = 'tabdo'

" Recommended snippets
Plug 'honza/vim-snippets'


" --- Obsession ---
" :help obsess
" :help obsession-status
Plug 'tpope/vim-obsession'


" --- Vim Wiki ---
" :help vimwiki
" :help vimwiki-commands
" :help vimwiki-mappings
Plug 'vimwiki/vimwiki'

" REVISIT: Figure out how to not get my mapping overwritten
" Default: nmap <silent><buffer> <CR> <Plug>VimwikiFollowLink
"nmap <silent><buffer> <Space><CR> <Plug>VimwikiFollowLink


" --- vimagit ---
" Inspired from emacs' magit
Plug 'jreybert/vimagit'


" --- Quick-Scope ---
" Highlights characters that are good targets for F/f/T/t
" No longer needed with vim-easymotion
Plug 'unblevable/quick-scope'

" --- NERDTree ---
" Filesystem explorer
" :help NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" --- Ctag Browser ---
" :help tagbar
Plug 'majutsushi/tagbar'

" --- Git ---
" :help fugitive
Plug 'tpope/vim-fugitive'

" signify is faster than 'airblade/vim-gitgutter'
" :help signify
Plug 'mhinz/vim-signify'
omap ic <plug>(signify-motion-inner-pending)
xmap ic <plug>(signify-motion-inner-visual)
omap ac <plug>(signify-motion-outer-pending)
xmap ac <plug>(signify-motion-outer-visual)

let g:signify_vcs_cmds = {
	\ 'git': 'git diff --no-color --no-ext-diff -U0 --ignore-all-space --ignore-blank-lines -- %f'
\ }


" --- Linter ---
" Asynchronous Linting Engine (ALE)
" :help ale
"Plug 'w0rp/ale'

" Ruby linter
Plug 'bbatsov/rubocop'

" --- vim-manpager ---
" export MANPAGER="vim -c MANPAGER -"
Plug 'lambdalisue/vim-manpager'

" --- matchit ---
" :help matchit
Plug 'tmhedberg/matchit'

" --- Comments ---
Plug 'scrooloose/nerdcommenter'

" --- tmux support ---
Plug 'tpope/vim-tbone'

" --- Text Objects ---
" Text object based on indentation level
Plug 'michaeljsmith/vim-indent-object'

" --- Undo Tree ---
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
noremap <silent><unique> <C-r> :UndotreeToggle<CR>

" --- Search ---
" Displays number of times pattern occurs
"Plug 'google/vim-searchindex'

" Displays number of times pattern occurs
Plug 'henrik/vim-indexed-search'

" Automatically clears search highlight
Plug 'junegunn/vim-slash'
noremap <silent> <Plug>(slash-after) :<C-u>ShowSearchIndex<CR>
xunmap <Plug>(slash-after)

" Search for two characters
"Plug 'justinmk/vim-sneak'
"map s <Plug>sneak_s


" ==============================================================================
" COMMANDS
" ==============================================================================

" --- vim-easy-align ---
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" --- vim-surround ---
" :help surround
Plug 'tpope/vim-surround'

" --- vim-speeddating ---
" :help speeddating
Plug 'tpope/vim-speeddating'

" --- vim-repeat ---
" Support repeat for Plug commands
Plug 'tpope/vim-repeat'


" ==============================================================================
" SYNTAX
" ==============================================================================

" --- Fish Syntax ---
Plug 'dag/vim-fish'

" --- .tmux.conf Syntax ---
Plug 'keith/tmux.vim'

" --- Verilog/SystemVerilog ---
Plug 'vhda/verilog_systemverilog.vim'
"Plug 'verilog_systemverilog.vim'

" --- vim-scripts ---
Plug 'vim-scripts/CountJump'
Plug 'vim-scripts/ingo-library'

" --- Miscellaneous ---
Plug 'guns/xterm-color-table.vim',  { 'on': 'XtermColorTable' }
cnoreabbrev colortable XtermColorTable


" ==============================================================================
" EXPERIMENTAL PLUGINS
" ==============================================================================

"Plug 'tpope/vim-dispatch'


" ==============================================================================
" TODD-ONLY STUFF
" ==============================================================================
Plug '~/.vim/my-plugins'

