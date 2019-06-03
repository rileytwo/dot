if exists('did_load_filetypes')
    finish
endif
augroup filetype_shell
    autocmd!
    autocmd BufRead,BufNewFile *.defaults set filetype=sh
    autocmd BufRead,BufNewFile *.aliases set filetype=sh
    autocmd BufRead,BufNewFile *.functions set filetype=sh
augroup END
