" ====================
" // Detect OS, TERM
" ----------
" check for truecolor support in current terminal
" NOTE: macOS Terminal.app does not support truecolor

if has('mac')
    let g:os = 'Darwin'
    if $TERM_PROGRAM =~# 'Apple_Terminal'
        colorscheme one
    else
        "if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit' || has('gui_vimr')
        set termguicolors
        colorscheme kiss
    endif
elseif has('win32') || has('win64')
    let g:os = 'Windows'
    set termguicolors
    colorscheme kiss
else
    let g:os = 'Linux'
    set termguicolors
    colorscheme kiss
endif



" ====================
" // Plugins (vim-plug)
" ----------
call plug#begin('~/.config/vim/plugged')


" // tpope (he deserves his own section)
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-sleuth'


" // Completion, snippets
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim',          {'do': ':UpdateRemotePlugins'}
Plug 'deoplete-plugins/deoplete-zsh'
Plug 'sirver/UltiSnips',
Plug 'roxma/nvim-yarp'

Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-ultisnips'


" // Language Plugins
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'MaxMellon/vim-jsx-pretty',       {'for': 'jsx'}
Plug 'pangloss/vim-javascript',        {'for': 'javascript'}
Plug 'tpope/vim-markdown',             {'for': 'markdown'}
Plug 'junegunn/goyo.vim',              {'for': 'markdown'}
Plug 'PProvost/vim-ps1',               {'for': 'powershell'}
Plug 'gaalcaras/ncm-R',                {'for': 'R'}
Plug 'jalvesaq/Nvim-R',                {'for': 'R'}
Plug 'chrisbra/vim-zsh',               {'for': 'zsh'}


Plug 'vitalk/vim-shebang'
Plug 'dkarter/bullets.vim'
Plug 'cespare/vim-toml'
Plug 'darfink/vim-plist'
Plug 'keith/swift.vim'
Plug 'xu-cheng/brew.vim'


" // Editor Plugins
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/vim-gitbranch'
Plug 'lambdalisue/suda.vim'

Plug 'psliwka/vim-smoothie'  " Smooth scrolling
Plug 'PeterRincker/vim-searchlight'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'

Plug 'jeetsukumaran/vim-buffergator'
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'


" // Colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'rakr/vim-two-firewatch'
Plug 'aonemd/kuroi.vim'


if !has('win32') && !has('win64')
    " mac specific plugs cause windows is hard
    Plug '/usr/local/opt/fzf'
endif
if &term=~# 'nvim' || &term=~# 'vimr'
    Plug 'terryma/vim-multiple-cursors'
endif


call plug#end()
" ----------
" ====================



" ====================
" // Options
" ':set is for setting options, 
"  :let is for assigning a value to a variable'
" ----------
set encoding=UTF-8
scriptencoding UTF-8
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

if has('mac') || has('unix')
    set number
    set numberwidth=1
    "set guicursor=
    "    \n-v-c-sm:hor20,
    "    \i-ci-ve:ver25,
    "    \r-cr-o:block
    set cursorline
else
    set number
    set numberwidth=1
    set guicursor=
        \n-v-c-sm:hor20,
        \i-ci-ve:ver25,
        \r-cr-o:block
    set cursorline
endif

set showtabline=2
set laststatus=2
set noshowmode

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

filetype plugin indent on

if !has('gui_vimr') && has('mac') && has('termguicolors')
    lua require'colorizer'.setup()
endif
" ----------
" ====================



" ====================
" // Variables
" ----------
if has('mac') || has('unix')
    let g:python_host_prog = $HOME.'/.pyenv/versions/neovim2/bin/python'
    let g:python3_host_prog = $HOME.'/.pyenv/versions/neovim3/bin/python'
endif


let g:vim_indent_cont = &shiftwidth
let g:deoplete#enable_at_startup = 1
"call deoplete#custom#source('_', 'max_menu_width', 80)

let g:suda#prefix = ['suda://', 'sudo://', '_://']

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:indentLine_setColors = 0
let g:indentLine_char = '│'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2


let entry_format = "'   ['. index .']'. repeat(' ', (3 - strlen(index)))"
if exists('*WebDevIconsGetFileTypeSymbol')
    let entry_format .= 
        \ ". WebDevIconsGetFileTypeSymbol(entry_path) .' '.  entry_path" 
else
    let entry_format .= '. entry_path'
endif


" R
let R_app = 'radian'
let R_cmd = 'R'
let R_hl_term = 0
let R_args = []  " if you had set any
let R_bracketed_paste = 1
let R_assign = 0
let R_hi_fun_globenv = 1


"" markdown
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


if has('mac') || has('linux') || &term =~# 'nvim'
    let g:lightline = {
        \ 'colorscheme': 'twofirewatch',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'readonly', 'modified' ],
        \             [ 'relativepath' ] ],
        \   'right': [ [ 'lineinfo' ],
        \              [ 'fileformat', 'filetype' ] ]
        \ }
        \ }
endif
" ----------
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

" vim-easy-align
" start EasyAlign (ga) command
nmap ga <Plug>(EasyAlign)

" buffer resizing:
"   = increase height
"   - decrease height
"   + increase width
"   _ decrease width
map = <C-W>+
map - <C-W>-
map + <C-W>>
map _ <C-W><

" copy/pasting
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
" ----------
" ====================

