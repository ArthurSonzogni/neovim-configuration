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
    Plug 'vim-scripts/tlib'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'

    " multiple cursors
    Plug 'terryma/vim-multiple-cursors'

    " beautiful theme
    Plug 'flazz/vim-colorschemes'

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

" The same command when entering in terminal 
tnoremap <C-j> <C-\><C-n><C-w>h
tnoremap <C-k> <C-\><C-n><C-w>j
tnoremap <C-h> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

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

" enable filetype plugin
if has('autocmd')
  filetype plugin indent on
endif

" syntax highlighting
if has('syntax')
    syntax enable
endif

" theme
colorscheme molokai

"highline curent line number
set cursorline

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Ignore compiled files
set wildignore=*.o,*~

" Always show current position
set ruler

" don't annoy with case
set ignorecase
set smartcase

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

" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" define scroll margin
set scrolloff=8
set sidescroll=1
set sidescrolloff=15

" airline-tabline
let g:airline#extensions#tabline#enabled = 1

" airline symbols
let g:airline_powerline_fonts = 1

