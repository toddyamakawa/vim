
" ==============================================================================
" DEFINE WHICHENV()
" ==============================================================================
" Function stolen shamelessly from:
" https://vimways.org/2018/make-your-setup-truly-cross-platform/
function! WhichEnv() abort
	if has('win64') || has('win32') || has('win16')
		return 'WINDOWS'
	else
		return toupper(substitute(system('uname'), '\n', '', ''))
	endif
endfunction


" ==============================================================================
" EXAMPLE
" ==============================================================================

" Do not run example code
finish

" This is example code
if (WhichEnv() =~# 'LINUX')
	SetLinuxEnv()
elseif (WhichEnv() =~# 'WINDOWS')
	SetWindowsEnv()
elseif (WhichEnv() =~# 'DARWIN')
	SetMacEnv()
else
	SetOtherEnv()
endif

