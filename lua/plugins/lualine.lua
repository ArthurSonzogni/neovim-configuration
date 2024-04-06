return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
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
        lualine_b = {{'filename', path = 4}},
        lualine_c = {'diff'},
        lualine_x = {'tabs'},
        lualine_y = {'datetime'},
        lualine_z = {'hostname'},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'searchcount'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {'mode'},
        lualine_b = {'filename'},
        lualine_c = {'searchcount'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {
        'lazy',
        'man',
        'nerdtree',
        'nvim-tree',
        'quickfix',
      },
    }
  end,
}
