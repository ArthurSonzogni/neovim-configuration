"""""""""""""""""""""""""""""""""""
" Author: Arthur Sonzogni
" :
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" Automaticly load pluings
" :
"""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

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
    
    " ctrl-p goto everywhere
    Plug 'kien/ctrlp.vim'

    " google indent
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'

call plug#end()

silent! call glaive#Install()

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
silent! colorscheme molokai

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


" custom file listing command
let g:ctrlp_user_command = 'find %s -type f -name "*.cc" -o -name "*.h" -o -name "*.cpp"'        " MacOSX/Linux

