if exists('did_load_filetypes')
    finish
endif
augroup filetype_powershell
    autocmd!
    autocmd BufRead,BufNewFile *.ps1 set filetype=powershell
augroup END
