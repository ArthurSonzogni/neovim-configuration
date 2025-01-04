return {
  "flazz/vim-colorschemes",
  dependencies = {
    --"folke/tokyonight.nvim",
    "loctvl842/monokai-pro.nvim",
  },
  config = function()
    -- Set colorscheme to tokyonight
    --vim.cmd("colorscheme tokyonight-night")
    require("monokai-pro").setup()
    vim.cmd("colorscheme monokai-pro")

    vim.opt.termguicolors = true
    vim.opt.background = "dark"
    --vim.opt.fillchars = vim.opt.fillchars + {vert = "▕"}

    -- Theme
    --vim.cmd("silent! colorscheme molokai")
    --vim.opt.fillchars = vim.opt.fillchars + {vert = "▕"}
    --vim.opt.termguicolors = true
  end,
}
