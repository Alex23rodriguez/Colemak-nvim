local opts = { noremap = true, silent = true }

local set_keymap = vim.api.nvim_set_keymap

set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
set_keymap("n", "h", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
set_keymap("n", "H", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
set_keymap("n", "<leader>C", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- set_keymap("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
set_keymap("n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)
set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
