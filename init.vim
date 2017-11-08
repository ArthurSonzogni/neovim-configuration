"--------------------------------------------------
" My personal neovim configuration.
" Feel free to take parts you like.
"                                 ~Arthur Sonzogni
"--------------------------------------------------

"-------------------------------------------------------------------------------
" Automatically load plugins
"-------------------------------------------------------------------------------
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

    " File explorer
    Plug 'scrooloose/nerdtree' , {'on': 'NERDTreeToggle'}

    " Toogle comment with <leader-c-space>
    Plug 'scrooloose/nerdcommenter'

    " Alternate header/implementation :A
    Plug 'vim-scripts/a.vim' , {'on' : 'A'}

    " Beautiful status lines
    Plug 'vim-airline/vim-airline'

    " Snippet completion
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'vim-scripts/tlib'
    Plug 'garbas/vim-snipmate'
    Plug 'honza/vim-snippets'

    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors'

    " Beautiful theme
    Plug 'flazz/vim-colorschemes', { 'do': ':colorscheme molokai'}

    " Syntax highlighting
    Plug 'sheerun/vim-polyglot'

    " Align element
    Plug 'godlygeek/tabular'
    
    " Google indent
    " :FormatLines
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'
    Plug 'google/vim-glaive'

    " Codi, python interactive scratchpad
    " :Codi to enable it
    Plug 'metakirby5/codi.vim' , {'on': 'Codi'}

    " undotree vizualizer
    " use ctrl-u
    Plug 'mbbill/undotree' , {'on': 'UndotreeToggle'}

    " buffergator
    " use ctrl-b
    Plug 'jeetsukumaran/vim-buffergator' , {'on' : 'BuffergatorToggle'}

    " Simply move the cursor to the start position, hit CTRL-V to enter
    " blockwise Visual mode and move the cursor to define the rectangle or
    " line. Finally, type <leader>d to draw the rectangle or line.
    Plug 'vim-scripts/draw.vim'

    " Vim git gutter.
    Plug 'airblade/vim-gitgutter'

    "------------------
    " Unused plugins
    "------------------

    " YouCompleteMe
    "Plug 'Valloric/YouCompleteMe'

    " Ctrl-p goto everywhere
    "Plug 'kien/ctrlp.vim'


call plug#end()

silent! call glaive#Install()

"-------------------------------------------------------------------------------
" Key mapping
"-------------------------------------------------------------------------------
" visual shifting (can repeat shifting)
vnoremap < <gv
vnoremap > >gv

" Select another window (normal mode)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Move the current window (normal mode)
map <C-A-j> <C-W>J
map <C-A-k> <C-W>K
map <C-A-h> <C-W>H
map <C-A-l> <C-W>L

" Select window (terminal mode)
tnoremap <C-j> <C-\><C-n><C-w>h
tnoremap <C-k> <C-\><C-n><C-w>j
tnoremap <C-h> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Move the current window (terminal mode)
tnoremap <C-A-j> <C-\><C-n><C-w>H
tnoremap <C-A-k> <C-\><C-n><C-w>J
tnoremap <C-A-h> <C-\><C-n><C-w>K
tnoremap <C-A-l> <C-\><C-n><C-w>L

" Use Esc to go to normal mode in terminal
tnoremap <Esc> <C-\><C-n>

" Don't use arrow key in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Navigate into console error messages.
nmap <F5> :cnext<CR>
nmap <F6> :cprev<CR>

" Use :FormatLines instead of the default vim formatter.
autocmd FileType c vmap = :FormatLines<CR>
autocmd FileType cpp vmap = :FormatLines<CR>
autocmd FileType h vmap = :FormatLines<CR>
autocmd FileType hpp vmap = :FormatLines<CR>

"---------------
" NerdTree
"---------------
map <C-d> :NERDTreeToggle<CR>

"---------------
" UndoTree
"---------------
map <C-u> :UndotreeToggle<cr>

"---------------
" BufferGator
"---------------
map <C-b> :BuffergatorToggle<cr>

"-------------------------------------------------------------------------------
" Configuration
"-------------------------------------------------------------------------------

" Enable filetype plugin
if has('autocmd')
  filetype plugin indent on
endif

" Syntax highlighting
if has('syntax')
    syntax enable
endif

" Theme
silent! colorscheme molokai

" hightlight the 80th column
set colorcolumn=80

" Highline curent line number
set cursorline

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Ignore compiled files
set wildignore=*.o,*~

" Always show current position
set ruler

" Show a complete menu
set completeopt=longest,menuone

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
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

set textwidth=80
set wrap

" define scroll margin
set scrolloff=8
set sidescroll=1
set sidescrolloff=15

" Navigate screen line instead of file line
nnoremap j gj
nnoremap k gk

" Enable use of the mouse
set mouse=a

" vim draw: define visual selection beyond the end of the line.
set virtualedit+=block

set guicursor=

"---------------
" airline
"---------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"---------------
" buffergator
"---------------
" Keep Buffergator window open after selecting a buffer
let g:buffergator_autodismiss_on_select = 0

" Update Buffergator window if buffer changes
let g:buffergator_autoupdate = 1

" Set how buffergator display its buffer
let g:buffergator_show_full_directory_path = 0

let g:buffergator_viewport_split_policy = "R"

"---------------
" Ctrl--P
"---------------
" custom file listing command
let g:ctrlp_user_command = 'find %s -type f -name "*.cc" -o -name "*.h" -o -name "*.cpp"'

"---------------
" YouCompleteMe
"---------------
" Use chrome config.    
let g:ycm_global_ycm_extra_conf = $HOME."/chromium/.ycm_extra_conf.py"
