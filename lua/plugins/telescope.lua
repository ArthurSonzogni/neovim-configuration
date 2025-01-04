return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true, desc = 'Find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true, desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true, desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true, desc = 'Help tags' })
  end
}
