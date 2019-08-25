""""""""""""""""""""
""     global     ""
""""""""""""""""""""
set encoding=UTF-8
scriptencoding utf-8



"""""""""""""""""""
""   os checks   ""
"""""""""""""""""""

" TODO: add linux 
if has('mac')
    let g:os = 'Darwin'
    if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
        set termguicolors
        colorscheme riley
    endif
else
    let g:os = 'Windows'
    if &term =~# 'vtpcon' || &term =~# 'builtin_vtpcon' 
        set termguicolors
    endif
endif


set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start

set mouse=a
set number
set smartcase
set showcmd
set gdefault
set magic
set splitbelow 
set splitright
set modifiable

if has('mac')
    set cursorline
endif

set number
set numberwidth=1

set showtabline=2
set laststatus=2

set noshowmode
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

filetype on
filetype plugin indent on
let g:vim_indent_cont = &shiftwidth


"" // plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sleuth'

Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-zsh', {'for': 'zsh'}
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'roxma/nvim-yarp'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'jalvesaq/Nvim-R', {'for': 'R'}
Plug 'PProvost/vim-ps1', {'for': 'powershell'}
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
    Plug '/usr/local/opt/fzf'
endif

Plug 'w0rp/ale'
Plug 'maximbaz/lightline-ale'

call plug#end()


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
elseif has('win32') || has('win64')
    let g:lightline = {
        \ 'colorscheme': 'twofirewatch',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
        \             [ 'LightLineFilename' ] ]
        \ }
        \ }
else 
    let g:lightline = {
        \ 'colorscheme': 'wombat'
        \ }
endif

function! LightLineFilename()
    return expand('%')
endfunction

syntax enable

""""""""""""""""
""   remaps   ""
""""""""""""""""
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



"" // Options
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
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


