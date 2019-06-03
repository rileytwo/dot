"" global
set encoding=UTF-8
scriptencoding utf-8
syntax on
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start
set mouse=a
set number
set smartcase
set showcmd
set gdefault
set magic
set guicursor=
    \n-v-c-sm:hor20,
    \i-ci-ve:ver25,
    \r-cr-o:block
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
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
filetype plugin indent on
let g:vim_indent_cont = &shiftwidth

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

"" Indent file
nnoremap <C-I> gg=G``

"" NERDTreeToggle
map <C-o> :NERDTreeToggle<CR>


"" Radian
let R_app = 'radian'
let R_cmd = 'R'
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1

" plugins using vim-plug
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'

Plug 'jalvesaq/Nvim-R', {'for': 'R'}
Plug 'PProvost/vim-ps1'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'

Plug 'godlygeek/tabular'
Plug 'dkarter/bullets.vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'ntk148v/vim-horizon'
Plug 'rafi/awesome-vim-colorschemes'

Plug 'rakr/vim-two-firewatch'
Plug 'aonemd/kuroi.vim'

Plug 'itchyny/lightline.vim'

if has('mac')
    " mac specific plugs cause windows is hard
    Plug '/usr/local/opt/fzf'
    Plug 'Valloric/YouCompleteMe'
    Plug 'w0rp/ale'
    Plug 'maximbaz/lightline-ale'
endif


call plug#end()

let R_assign = 0
let R_hi_fun_globenv = 1

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

let NERDTreeDirArrows = 1

let g:indentLine_setColors = 0
let g:indentLine_char = '│'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:markdown_fenced_languages = [
    \ 'html',
    \ 'python',
    \ 'bash=sh',
    \ 'zsh=sh',
    \ 'r'
    \ ]

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \ ]

" lightline/ale info at maximbaz/dotfiles/.config/nvim/init.vim

if has('mac')
    let g:lightline = {
        \ 'colorscheme': 'twofirewatch',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
        \             [ 'LightLineFilename' ] ]
        \ },
        \ 'component_function': {
        \   'filename': 'LightLineFilename',
        \   'gitbranch': 'fugitive#head'
        \ }
        \ }
else
    let g:lightline = {
        \ 'colorscheme': 'twofirewatch',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
        \             [ 'LightLineFilename' ] ]
        \ }
        \ }
endif

function! LightLineFilename()
    return expand('%')
endfunction

syntax enable

if has('mac')
    let g:os = 'Darwin'
    colorscheme riley
    set termguicolors
else
    let g:os = 'Windows'
    set termguicolors
    colorscheme riley
    set term=builtin_vtpcon
endif

