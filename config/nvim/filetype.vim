if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.zshrc  setfiletype zsh
    au! BufRead,BufNewFile *.zsh-theme  setfiletype zsh
    au! BufRead,BufNewFile *.rstheme  setfiletype css
    au! BufRead,BufNewFile *.aliases  setfiletype sh
augroup END

