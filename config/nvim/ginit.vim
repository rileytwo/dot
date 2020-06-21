" =====================
" // Set Guifont
if has('win32') || has('win64') && &term =~# 'nvim'
    execute "GuiFont! Hack Nerd Font Mono:h10"
    execute "GuiTabline 0"
    execute "GuiPopupmenu 0"
    hi! Normal guibg=#171717
endif

if has('gui_vimr')
    hi! Normal guibg=#151515
endif
