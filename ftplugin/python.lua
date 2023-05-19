local opts = { noremap = true, silent = true }

vim.cmd("let g:jupyter_mapkeys = 0")
vim.api.nvim_set_keymap("n", "<leader>jj", "<cmd>JupyterConnect<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>jd", "<cmd>JupyterDisconnect<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>jf", "<cmd>JupyterRunFile<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>JupyterSendCell<cr>", opts)
-- workaround send range in visual mode
-- exits and enters visual mode to set '< and '>
-- note that it also sets a mark in 'j, so may override whatever may be there
vim.api.nvim_set_keymap("v", "<leader>c", "mjvv<cmd>'<,'>JupyterSendRange<cr>v'j", opts)

vim.api.nvim_set_keymap("n", "#u", "o<CR><CR>###<esc>kk", opts)
vim.api.nvim_set_keymap("n", "#e", "i###<CR><CR><esc>", opts)
vim.api.nvim_set_keymap("n", "#i", "i###<CR><CR><CR><CR>###<esc>kk", opts)
vim.api.nvim_set_keymap("n", "#d", "/###<CR>dN:noh<CR>", opts)
vim.api.nvim_set_keymap("n", "##", "i###<esc>", opts)
