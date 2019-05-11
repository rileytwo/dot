set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start
set mouse=nicr

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
map <C-o> :NERDTreeToggle<CR>

set splitbelow
set splitright
set nu
set numberwidth=1
set smartcase
set laststatus=2
set noshowmode

filetype on
filetype plugin indent on

set smartindent
set tabstop=4
set shiftwidth=2
set expandtab
set autoindent


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
Plug 'tpope/vim-fugitive'
call plug#end()

syntax enable
colorscheme riley


let NERDTreeShowHidden=1

let g:indentLine_setColors = 0
let g:indentLine_char = '│'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }



