function Map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Navigate screen line instead of file line
Map("n", "j", "gj", { desc = "Move down screen line" })
Map("n", "k", "gk", { desc = "Move up screen line" })

-- visual shifting (can repeat shifting)
Map("v", "<", "<gv", { desc = "Shift left" })
Map("v", ">", ">gv", { desc = "Shift right" })

-- Select another window (normal mode)
Map("n", "<C-j>", "<C-W>j", { desc = "Select window below" })
Map("n", "<C-k>", "<C-W>k", { desc = "Select window above" })
Map("n", "<C-h>", "<C-W>h", { desc = "Select window left" })
Map("n", "<C-l>", "<C-W>l", { desc = "Select window right" })

-- Move the current window (normal mode)
Map("n", "<C-A-j>", "<C-W>J", { desc = "Move window down" })
Map("n", "<C-A-k>", "<C-W>K", { desc = "Move window up" })
Map("n", "<C-A-h>", "<C-W>H", { desc = "Move window left" })
Map("n", "<C-A-l>", "<C-W>L", { desc = "Move window right" })

-- Select window (terminal mode)
Map("t", "<C-j>", "<C-\\><C-n><C-w>h", { desc = "Select window below" })
Map("t", "<C-k>", "<C-\\><C-n><C-w>j", { desc = "Select window above" })
Map("t", "<C-h>", "<C-\\><C-n><C-w>k", { desc = "Select window left" })
Map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Select window right" })

-- Move the current window (terminal mode)
Map("t", "<C-A-j>", "<C-\\><C-n><C-w>H", { desc = "Move window down" })
Map("t", "<C-A-k>", "<C-\\><C-n><C-w>J", { desc = "Move window up" })
Map("t", "<C-A-h>", "<C-\\><C-n><C-w>K", { desc = "Move window left" })
Map("t", "<C-A-l>", "<C-\\><C-n><C-w>L", { desc = "Move window right" })

-- Use Esc to go to normal mode in terminal
Map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Don't use arrow key in normal mode
Map("n", "<Up>", "<nop>", { desc = "No operation" })
Map("n", "<Down>", "<nop>", { desc = "No operation" })
Map("n", "<Left>", "<nop>", { desc = "No operation" })
Map("n", "<Right>", "<nop>", { desc = "No operation" })

-- Navigate into console error messages.
Map("n", "<F1>", ":make<CR>", { desc = "Run make" })
Map("n", "<F5>", ":cnext<CR>", { desc = "Next error" })
Map("n", "<F6>", ":cprev<CR>", { desc = "Previous error" })
Map("n", "<F8>", ":vertical wincmd f<CR>", { desc = "Open file under cursor" })

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    Map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {buffer = event.buf, desc = "Show hover information"})
    Map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {buffer = event.buf, desc = "Go to definition"})
    Map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {buffer = event.buf, desc = "Go to declaration"})
    Map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {buffer = event.buf, desc = "Go to implementation"})
    Map('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {buffer = event.buf, desc = "Go to type definition"})
    Map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {buffer = event.buf, desc = "Show references"})
    Map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {buffer = event.buf, desc = "Show signature help"})
    Map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', {buffer = event.buf, desc = "Rename symbol"})
    Map({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {buffer = event.buf, desc = "Format code"})
    Map('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', {buffer = event.buf, desc = "Show code actions"})
  end
})

