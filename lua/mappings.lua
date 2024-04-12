function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Navigate screen line instead of file line
Map("n", "j", "gj")
Map("n", "k", "gk")

-- visual shifting (can repeat shifting)
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- Select another window (normal mode)
Map("n", "<C-j>", "<C-W>j")
Map("n", "<C-k>", "<C-W>k")
Map("n", "<C-h>", "<C-W>h")
Map("n", "<C-l>", "<C-W>l")

-- Move the current window (normal mode)
Map("n", "<C-A-j>", "<C-W>J")
Map("n", "<C-A-k>", "<C-W>K")
Map("n", "<C-A-h>", "<C-W>H")
Map("n", "<C-A-l>", "<C-W>L")

-- Select window (terminal mode)
Map("t", "<C-j>", "<C-\\><C-n><C-w>h")
Map("t", "<C-k>", "<C-\\><C-n><C-w>j")
Map("t", "<C-h>", "<C-\\><C-n><C-w>k")
Map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Move the current window (terminal mode)
Map("t", "<C-A-j>", "<C-\\><C-n><C-w>H")
Map("t", "<C-A-k>", "<C-\\><C-n><C-w>J")
Map("t", "<C-A-h>", "<C-\\><C-n><C-w>K")
Map("t", "<C-A-l>", "<C-\\><C-n><C-w>L")

-- Use Esc to go to normal mode in terminal
Map("t", "<Esc>", "<C-\\><C-n>")

-- Don't use arrow key in normal mode
Map("n", "<Up>", "<nop>")
Map("n", "<Down>", "<nop>")
Map("n", "<Left>", "<nop>")
Map("n", "<Right>", "<nop>")

-- Navigate into console error messages.
Map("n", "<F1>", ":make<CR>")
Map("n", "<F5>", ":cnext<CR>")
Map("n", "<F6>", ":cprev<CR>")
Map("n", "<F8>", ":vertical wincmd f<CR>")

