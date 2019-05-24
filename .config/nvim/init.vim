syntax on
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start
set mouse=nicr

"set directory=.,$TEMP
set encoding=UTF-8
set number
set smartcase
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start
set mouse=nicr

"" remaps
" pane navigation:
"   <C-J> go to pane below
"   <C-K> go to pane above
"   <C-L> go to pane right
"   <C-H> go to pane left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Indent file
nnoremap <C-I> gg=G``          
" NERDTreeToggle
map <C-o> :NERDTreeToggle<CR>

set splitbelow 
set splitright
set modifiable

set number
set numberwidth=1
set cursorline

set showtabline=2
set laststatus=2
set noshowmode
set ignorecase
set smartcase

filetype on

filetype plugin indent on

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
let g:vim_indent_cont = &shiftwidth

" plugins using vim-plug
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'aonemd/kuroi.vim'
Plug 'ntk148v/vim-horizon'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rakr/vim-two-firewatch'
Plug 'tpope/vim-fugitive'
Plug 'jalvesaq/Nvim-R', {'for': 'R'}
Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'
Plug 'PProvost/vim-ps1'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

call plug#end()


set guicursor=
    \n-v-c-sm:hor20,
    \i-ci-ve:ver25,
    \r-cr-o:block


let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:indentLine_setColors = 0
let g:indentLine_char = '│'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" lightline/ale info at maximbaz/dotfiles/.config/nvim/init.vim
let g:lightline = {
    \ 'colorscheme': 'twofirewatch',
    \ 'component_function': {
    \   'filename': 'LightLineFilename'
    \ }
    \ }
function! LightLineFilename()
    return expand('%')
endfunction

syntax enable

if has('mac')
    let g:os = 'Darwin'
    colorscheme riley
    set termguicolors
    "let g:syntastic_loc_list_height = 4
    "let g:syntastic_error_symbol = '𐄂'
    "let g:syntastic_style_error_symbol = '𐄂'
    "let g:syntastic_warning_symbol = '!!'
    "let g:syntastic_style_warning_symbol = '!!'
    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    "let g:syntastic_check_on_open = 1
    "let g:syntastic_check_on_wq = 0
    "let g:syntastic_enable_highlighting = 1
else
    let g:os = 'Windows'
    set termguicolors
    colorscheme riley
endif

