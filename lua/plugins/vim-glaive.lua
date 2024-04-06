return {
  'google/vim-glaive',
  dependencies = {
    'google/vim-maktaba',
    'google/vim-codefmt',
  },
  config = function()
    vim.cmd([[
      call glaive#Install()
      autocmd FileType c vmap = :FormatLines<CR>
      autocmd FileType cpp vmap = :FormatLines<CR>
      autocmd FileType h vmap = :FormatLines<CR>
      autocmd FileType hpp vmap = :FormatLines<CR>
      ]])
  end,
}
