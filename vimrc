" This is the basic setup.
syntax on
filetype on
filetype plugin on
filetype indent on

" Theme and looks
colorscheme tomorrow-night-eighties
set guifont=Inconsolata\ Regular:h18
set colorcolumn=90
set number

set hidden
set history=100
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set showmatch
set hlsearch

set t_Co=256
set background=dark

" Plugin start from here
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"The interface and the looks
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/tomorrow-theme'
Plug 'jacoborus/tender.vim'

"Basic function
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf'
Plug 'jakedouglas/exuberant-ctags'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neocomplete.vim'

"General programming
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'rizzatti/dash.vim'


"Language support
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
"Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-markdown'
"Plug 'klen/python-mode'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'
Plug 'hdima/python-syntax'
Plug 'chrisbra/csv.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-scripts/c.vim'
Plug 'jalvesaq/Nvim-R'
"Plug 'roxma/nvim-completion-manager'
"Plug 'gaalcaras/ncm-R'
"Optional for snippet support
Plug 'sirver/UltiSnips'
"Plug 'w0rp/ale'

call plug#end()

"Settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
" set a minimum source editor width
let R_min_editor_width = 80

" make sure the console is at the bottom by making it really wide
let R_rconsole_width = 1000

" show arguments for functions during omnicompletion
let R_show_args = 1

" Don't expand a dataframe to show columns by default
let R_objbr_opendf = 0

" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine
