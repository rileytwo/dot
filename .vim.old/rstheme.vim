"if exists('did_load_filetypes')
"    finish
"endif
"augroup filetype_rstheme
"    autocmd!
"    autocmd BufRead,BufNewFile *.rstheme set filetype=css
"augroup END



autocmd BufRead,BufNewFile *.rstheme set filetype=css
