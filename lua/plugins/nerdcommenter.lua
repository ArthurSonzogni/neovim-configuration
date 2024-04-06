return {
  "scrooloose/nerdcommenter",
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>c<space>',
      '<Plug>NERDCommenterToggle', {noremap = true})
  end
}
