return {
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
}
