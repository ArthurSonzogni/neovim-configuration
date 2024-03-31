-- Enable filetype plugin
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

-- Theme
vim.cmd("silent! colorscheme molokai")
vim.opt.termguicolors = true

-- hightlight the 80th column
vim.opt.colorcolumn = "80"

-- Highline curent line number
vim.opt.cursorline = true

-- Turn backup off, since most stuff is in SVN, git et.c anyway...
vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

-- Ignore compiled files
vim.opt.wildignore = "*.o,*~"

-- Always show current position
vim.opt.ruler = true

-- Show a complete menu
vim.opt.completeopt = "longest,menuone"

-- don't annoy with case
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- For regular expressions turn magic on
vim.opt.magic = true

-- Show matching brackets when text indicator is over them
vim.opt.showmatch = true

-- No annoying sound on errors
vim.opt.errorbells = false
vim.opt.visualbell = false

-- display line number
vim.opt.number = true

-- always show status line
vim.opt.laststatus = 2

-- 1 tab == 2 spaces
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

vim.opt.textwidth = 80
vim.opt.wrap = true

-- define scroll margin
vim.opt.scrolloff = 8
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 15

-- Mouse
vim.opt.mouse = "a"
