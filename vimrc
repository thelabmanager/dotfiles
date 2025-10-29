" Created: 2025-06-12 
" Updated: 2025-06-12
" Last Change: Add statusline customization

syntax enable 
filetype plugin indent on

" Basic Appearance
:set number

" Status Bar
set laststatus=2
set statusline=%F%m%r%h%w

" Silence
set noerrorbells
set visualbell
set t_vb=
if exists("&belloff")
  set belloff=all
endif

" Editing
set shiftwidth=4
set softtabstop=2
set expandtab " no tabs, just spaces
set autoindent
set splitright
set splitbelow
set cursorcolumn
set cursorline
set listchars=tab:\|\
set list

" Completion
set wildmenu
set wildmode=full:lastused

" Window
set splitright " open on the right

" Commands
:inoremap jh <Esc>
:inoremap jk <Esc>

" Search
:set ignorecase
:set smartcase

" Plugins
" https://github.com/junegunn/vim-plug#neovim

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'echasnovski/mini.nvim'

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Editor
Plug 'junegunn/vim-easy-align'
Plug 'dense-analysis/ale'
Plug 'echasnovski/mini.nvim'
Plug 'echasnovski/mini.basics'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Themes
Plug 'junegunn/seoul256.vim'

call plug#end()

" Plugin Settings

let b:ale_fixers = ['prettier', 'eslint']
let b:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

silent! colorscheme seoul256
let g:seoul256_background = 235
colo seoul256

" Commenting
nnoremap <space>/ :Commentary<CR>
:command VV Commentary
:command -range VVV :<line1>,<line2>Commentary
