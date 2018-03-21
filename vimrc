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

set softtabstop=4
set textwidth=79
set fileformat=unix
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
set encoding=utf-8
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
Plug 'wellle/tmux-complete.vim'

"General programming
Plug 'benmills/vimux'
Plug 'tomtom/tcomment_vim'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'rizzatti/dash.vim'
Plug 'christoomey/vim-tmux-navigator'


"Language support
Plug 'lervag/vimtex'
Plug 'pangloss/vim-javascript'
"Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-markdown'
"Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'pangloss/vim-javascript'
Plug 'nvie/vim-flake8'
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'
Plug 'hdima/python-syntax'
Plug 'chrisbra/csv.vim'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-scripts/c.vim'
Plug 'jalvesaq/Nvim-R'
"Plug 'roxma/nvim-completion-manager'
"Plug 'gaalcaras/ncm-R'
"Optional for snippet support
Plug 'sirver/UltiSnips'
"Plug 'w0rp/ale'
Plug 'vim-scripts/indentpython.vim'
Plug 'ervandew/supertab'
call plug#end()

"Settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
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
let python_highlight_all=1
" Press the space bar to send lines and selection to R console
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" Press Control + c to use VimuxCommandPrompt
nmap <c-c> :VimuxPromptCommand<CR>
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \set tabstop=2
    \set softtabstop=2
    \set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

let g:jedi#use_tabs_not_buffers = 1

let g:VimuxUseNearest = 0

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif
