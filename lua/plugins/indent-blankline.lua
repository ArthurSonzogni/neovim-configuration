return {
  'lukas-reineke/indent-blankline.nvim',
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
          fg = "#AAAAAA",
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
  }
