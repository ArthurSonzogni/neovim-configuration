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
    {
      "nvim-tree/nvim-tree.lua",
      config = function()
        require("nvim-tree").setup({
          sort = {
            sorter = "case_sensitive",
          },
          view = {
            width = 30,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = true,
          },
        })
      end,
      keys = {
        { "<C-d>", ":NvimTreeToggle<CR>"},
      },
  },



    -- Toogle comment with <leader-c-space>
    {
        "scrooloose/nerdcommenter",
        cmd = "NERDCommenterToggle",
        keys = {
            {"<leader>c<space>", "<Plug>NERDCommenterToggle",},
        },
    },

    -- buffergator
    {
        "jeetsukumaran/vim-buffergator",
        keys = {
            { "<C-b>", ":BuffergatorToggle<cr>" },
        },
        cmd = "BuffergatorToggle",
        init = function()
            vim.g.buffergator_autodismiss_on_select = 0
            vim.g.buffergator_autoupdate = 1
            vim.g.buffergator_show_full_directory_path = 0
            vim.g.buffergator_viewport_split_policy = "R"
        end,
    },

    -- Alternate header/implementation :A
    {
        "vim-scripts/a.vim",
        cmd = "A"
    },

    -- Beautiful status lines
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = false,
                    theme = 'ayu_dark',
                    section_separators = {
                        left = '',
                        right = '',
                    },
                    component_separators = {
                        left = '|',
                        right = '|',
                    },
                    disabled_filetypes = {},
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 2000,
                        tabline = 2000,
                        winbar = 2000,
                    }
                },
                tabline= {
                    lualine_a = {'branch'},
                    lualine_b = {'diff'},
                    lualine_c = {'diagnostics'},
                    lualine_x = {'tabs'},
                    lualine_y = {'datetime'},
                    lualine_z = {'hostname'},
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'searchcount'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'searchcount'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                winbar = {},
                inactive_winbar = {},
                extensions = {
                    'nerdtree',
                    'quickfix',
                    'nvim-tree',
                    'man'
                },
            }
        end,
    },

    {
        {
            'lukas-reineke/indent-blankline.nvim',
            branch = 'v3',
            event = 'BufReadPre',
            config = function()
                local highlight = {
                    "Indent1",
                    "Indent2",
                }
                local highlight_scoped = {
                    "IndentScoped",
                }

                local hooks = require "ibl.hooks"
                -- create the highlight groups in the highlight setup hook, so they are reset
                -- every time the colorscheme changes
                hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                    vim.api.nvim_set_hl(0, "Indent1", {
                        fg = "#333333",
                    });
                    vim.api.nvim_set_hl(0, "Indent2", {
                        fg = "#555555",
                    })
                    vim.api.nvim_set_hl(0, "IndentScoped", {
                        fg = "#FF3344",
                    });
                end)

                require("ibl").setup({
                    indent = {
                        highlight = highlight,
                        char = "│",
                    },
                    scope = {
                        enabled = true,
                        highlight = highlight_scoped,
                    },
                })
            end,
        },
    },

    -- CSS colors
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require("nvim-highlight-colors").setup {
                ---Render style
                ---@usage 'background'|'foreground'|'virtual'
                -- render = 'background',
                render = 'background',

                ---Set virtual symbol (requires render to be set to 'virtual')
                virtual_symbol = '■',

                ---Highlight named colors, e.g. 'green'
                enable_named_colors = true,

                ---Highlight tailwind colors, e.g. 'bg-blue-500'
                enable_tailwind = false,

                ---Set custom colors
                ---Label must be properly escaped with '%' to adhere to `string.gmatch`
                --- :help string.gmatch
                custom_colors = {
                    { label = '%-%-theme%-primary%-color', color = '#0f1219' },
                    { label = '%-%-theme%-secondary%-color', color = '#5a5d64' },
                }
            }
        end
    },

    -- Multiple cursors
    {
        "mg979/vim-visual-multi",
    },

    -- Beautiful theme
    {
        "flazz/vim-colorschemes",
    },

    -- Syntax highlighting
    {
        "sheerun/vim-polyglot",
    },

    -- Align element
    {
        "godlygeek/tabular",
        cmd = "Tabularize"
    },

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
        cmd = {
            'Format',
            'FormatWrite',
            'FormatLines',
        },
        keys = {
            { "v", "=", ":FormatLines<CR>" },
        },
    },

    -- undotree vizualizer
    -- use ctrl-u
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = { -- load the plugin only when using it's keybinding:
            { "<C-u>", "<cmd>lua require('undotree').toggle()<cr>" },
        },
    },

    -- Simply move the cursor to the start position, hit CTRL-V to enter
    -- blockwise Visual mode and move the cursor to define the rectangle or
    -- line. Finally, type <leader>d to draw the rectangle or line.
    {
        "vim-scripts/draw.vim",
        init = function()
            vim.g.virtualedit = "all"
        end,
    },

    -- Vim git gutter.
    {
        "airblade/vim-gitgutter",
    },

    -- A useful home screen
    {
        "mhinz/vim-startify",
    },

    {
        "rust-lang/rust.vim",
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {},
                auto_install = true,
                sync_install = false,
                highlight = {
                    enable = true
                },
                indent = {
                    enable = true
                },  
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            })
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
    },
    {
        "folke/twilight.nvim",
        opts = {
        },
    },
    {
        "github/copilot.vim",
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
})
