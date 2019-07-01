" Vim filetype plugin file
" verilog_systemverilog plugin only contains: *.v,*.vh,*.vp,*.sv,*.svi,*.svh,*.svp
autocmd BufNewFile,BufRead *.v,*.vh,*.vp,*.sv,*.svi,*.svh,*.svp set ft=verilog_systemverilog
autocmd BufNewFile,BufRead *.sva,*.svrb,*.tdf,*.vc,*.vh set ft=verilog_systemverilog
