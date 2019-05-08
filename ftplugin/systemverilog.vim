

" ================================================================================================
" https://github.com/vhda/verilog_systemverilog.vim/blob/master/ftplugin/verilog_systemverilog.vim
" ================================================================================================

" Setup tmhedberg/matchit plugin
if exists("loaded_matchit")
	let b:match_ignorecase=0
	let b:match_words=
		\ '\<begin\>:\<end\>,' .
		\ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
		\ '`if\(n\)\?def\>:`elsif\>:`else\>:`endif\>,' .
		\ '\<module\>:\<endmodule\>,' .
		\ '\<if\>:\<else\>,' .
		\ '\<fork\>\s*;\@!$:\<join\(_any\|_none\)\?\>,' .
		\ '\<function\>:\<endfunction\>,' .
		\ '\<task\>:\<endtask\>,' .
		\ '\<specify\>:\<endspecify\>,' .
		\ '\<config\>:\<endconfig\>,' .
		\ '\<specify\>:\<endspecify\>,' .
		\ '\<generate\>:\<endgenerate\>,' .
		\ '\<primitive\>:\<endprimitive\>,' .
		\ '\<table\>:\<endtable\>,' .
		\ '\<class\>:\<endclass\>,' .
		\ '\<checker\>:\<endchecker\>,' .
		\ '\<interface\>:\<endinterface\>,' .
		\ '\<clocking\>:\<endclocking\>,' .
		\ '\<covergroup\>:\<endgroup\>,' .
		\ '\<package\>:\<endpackage\>,' .
		\ '\<program\>:\<endprogram\>,' .
		\ '\<property\>:\<endproperty\>,' .
		\ '\<sequence\>:\<endsequence\>'
endif

