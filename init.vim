"""""""""""""""""""""""""""""""""""
" Author: Arthur Sonzogni
" :
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" Plugins
" :
"""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
    "
    " file explorer
    Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}

     "toogle comment with <leader-c-space>
    Plug 'scrooloose/nerdcommenter'

    " alternate header/implementation :A
    Plug 'vim-scripts/a.vim'

    " beautiful status lines
    Plug 'vim-airline/vim-airline'

    " snippet completion
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'garbas/vim-snipmate'

    " multiple cursors
    Plug 'terryma/vim-multiple-cursors'

    " beautiful theme
    Plug 'crusoexia/vim-monokai'

    " syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " align element
    Plug 'godlygeek/tabular'
call plug#end()

"""""""""""""""""""""""""""""""""""
" Key mapping
" :
"""""""""""""""""""""""""""""""""""
" visual shifting (can repeat shifting
vnoremap < <gv
vnoremap > >gv

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" don't use arrow key in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" map nerdtree button (feel free to change)
map <C-d> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""
" configuration
" :
"""""""""""""""""""""""""""""""""""

" disable vi strange default
set nocompatible

" enable filetype plugin
if has('autocmd')
  filetype plugin indent on
endif

" syntax highlighting
if has('syntax')
    syntax enable
endif

" theme
colorscheme monokai

" inden on new line
set autoindent


"highline curent line number
set cursorline

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" activate mouse control
set mouse=a


" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~

" Always show current position
set ruler

" don't annoy with case
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell

" display line number
set number

" always show status line
set laststatus=2

" setmart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Automaticly reload unmodified file
set autoread

" define scroll margin
set scrolloff=8
set sidescroll=1
set sidescrolloff=15

" airline-tabline
let g:airline#extensions#tabline#enabled = 1

" airline symbols
let g:airline_powerline_fonts = 1

