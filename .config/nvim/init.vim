" ====================
" // Plugins (vim-plug)
" ----------
call plug#begin('~/.vim/plugged')

" tpope
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'

" // Completion, snippets
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-zsh'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-jedi'
Plug 'sirver/UltiSnips',
Plug 'ncm2/ncm2-ultisnips'

" // Lang specific
Plug 'tpope/vim-markdown'
Plug 'PProvost/vim-ps1'
Plug 'jalvesaq/Nvim-R', {'for': 'R'}
Plug 'gaalcaras/ncm-R', {'for': 'R'}
Plug 'dkarter/bullets.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'chrisbra/vim-zsh'

" // Auto closing delimiters
Plug 'Raimondi/delimitMate'

" // Colorschemes
Plug 'ntk148v/vim-horizon'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rakr/vim-two-firewatch'
Plug 'aonemd/kuroi.vim'

Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

if !has('win32') && !has('win64')
    " mac specific plugs cause windows is hard
    Plug '/usr/local/opt/fzf'
endif
if &term=~# 'nvim'
    Plug 'terryma/vim-multiple-cursors'
endif

" // helpful
Plug 'itchyny/vim-gitbranch'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'PeterRincker/vim-searchlight'

" // cool
Plug 'godlygeek/tabular'
Plug 'metakirby5/codi.vim'

" ----------
" // add plugins to &runtimepath
call plug#end()
" ====================

" ====================
" // Options
" ----------
set encoding=UTF-8
scriptencoding utf-8
syntax on
set whichwrap+=<,>,h,l,[,]
set backspace=indent,eol,start
set mouse=a

set smartcase
set showcmd
set gdefault
set magic

set splitbelow 
set splitright
set modifiable

if &term=~# 'nvim' || has('mac') || has('linux') 
    set number
    set numberwidth=1
    set guicursor=
        \n-v-c-sm:hor20,
        \i-ci-ve:ver25,
        \r-cr-o:block
    set cursorline
else
    set guicursor=
endif

set showtabline=2
set laststatus=2
set noshowmode

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

filetype plugin indent on
let g:vim_indent_cont = &shiftwidth
let g:deoplete#enable_at_startup = 1
" ----------
" //
" ====================


" ====================
" // Key Remaps
" ----------
" pane navigation:
"   <C-J> go to pane below
"   <C-K> go to pane above
"   <C-L> go to pane right
"   <C-H> go to pane left
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" indent file
nnoremap <C-I> gg=G``

" NERDTreeToggle
map <C-o> :NERDTreeToggle<CR>

" buffer resizing:
"   = increase height
"   - decrease height
"   + increase width
"   _ decrease width
map = <C-W>+
map - <C-W>-
map + <C-W>>
map _ <C-W><
" ----------
" //
" ====================


" ====================
" // Variables
" ----------
"
" Pynvim
if has('mac')
    let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
endif
"
" R
let R_app = 'radian'
let R_cmd = 'R'
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let R_assign = 0
let R_hi_fun_globenv = 1

" markdown
let g:markdown_syntax_conceal = 0
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

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" indentline
let g:indentLine_setColors = 0
let g:indentLine_char = '│'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" lightline/ale 
" more info at: info at maximbaz/dotfiles/.config/nvim/init.vim
if has('mac') || has('linux') || &term =~# 'nvim'
    let g:lightline = {
        \ 'colorscheme': 'twofirewatch',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'filename', 'modified' ],
        \             [ 'LightLineFilename' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'fileformat', 'filetype' ] ]
        \ },
        \ 'component_function': {
        \   'filename': 'LightLineFilename'
        \ }
        \ }
endif

" show full/path/to/file in buffer in LightLine
function! LightLineFilename()
    return expand('%')
endfunction

" check for truecolor support in current terminal
" macOS Terminal.app does not support truecolor
if !exists('g:os')
    if has('mac')
        let g:os = 'Darwin'
        if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
            set termguicolors
            colorscheme riley
        else
            colorscheme one
        endif
    elseif has('win32') || has('win64')
        let g:os = 'Windows'
        set termguicolors
        colorscheme riley
    else
        let g:os = 'Linux'
        set termguicolors
        colorscheme riley
    endif
endif

