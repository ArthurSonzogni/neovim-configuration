return {
  "flazz/vim-colorschemes",
  dependencies = {
    "folke/tokyonight.nvim",
  },
  config = function()
    -- Set colorscheme to tokyonight
    vim.cmd("colorscheme tokyonight-night")

    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    vim.opt.fillchars = vim.opt.fillchars + {vert = "▕"}

    -- Theme
    --vim.cmd("silent! colorscheme molokai")
    --vim.opt.fillchars = vim.opt.fillchars + {vert = "▕"}
    --vim.opt.termguicolors = true
  end,
}
