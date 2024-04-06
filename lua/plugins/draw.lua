return {
  -- Simply move the cursor to the start position, hit CTRL-V to enter
  -- blockwise Visual mode and move the cursor to define the rectangle or
  -- line. Finally, type <leader>d to draw the rectangle or line.
  "vim-scripts/draw.vim",
  init = function()
    vim.g.virtualedit = "all"
  end,
}
