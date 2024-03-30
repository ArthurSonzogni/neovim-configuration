local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- File explorer
    "scrooloose/nerdtree",

    -- Toogle comment with <leader-c-space>
    "scrooloose/nerdcommenter",

    -- Alternate header/implementation :A
    { "vim-scripts/a.vim", cmd = "A"},

    -- Beautiful status lines
    "vim-airline/vim-airline",

    -- Multiple cursors
    "mg979/vim-visual-multi",

    -- Beautiful theme
    "flazz/vim-colorschemes",

    -- Syntax highlighting
    "sheerun/vim-polyglot",

    -- Align element
    { "godlygeek/tabular", cmd = "Tabularize"},

    -- Google indent
    {
        'google/vim-codefmt',
        dependencies = {
            'google/vim-maktaba',
            {
                'google/vim-glaive',
                config = function()
                    vim.cmd('call glaive#Install()')
                end
            },
        },
    },

    -- undotree vizualizer
    -- use ctrl-u
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = {
            { "U", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },

    -- buffergator
    -- use ctrl-b
    {
        "jeetsukumaran/vim-buffergator",
        init = function()
            vim.g.buffergator_autodismiss_on_select = 0
            vim.g.buffergator_autoupdate = 1
            vim.g.buffergator_show_full_directory_path = 0
            vim.g.buffergator_viewport_split_policy = "R"
        end,
    },

    -- Simply move the cursor to the start position, hit CTRL-V to enter
    -- blockwise Visual mode and move the cursor to define the rectangle or
    -- line. Finally, type <leader>d to draw the rectangle or line.
    "vim-scripts/draw.vim",

    -- Vim git gutter.
    "airblade/vim-gitgutter",

    -- A useful home screen
    "mhinz/vim-startify",

    "rust-lang/rust.vim",

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "c",
                    "lua",
                    "vim",
                    "query",
                    "javascript",
                    "html",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },  
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "folke/twilight.nvim",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
})

vim.cmd("call glaive#Install()")
--Glaive codefmt plugin[mappings]
--Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

