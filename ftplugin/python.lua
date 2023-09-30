local opts = { noremap = true, silent = true }

vim.cmd("let g:jupyter_mapkeys = 0")
vim.api.nvim_buf_set_keymap(0, "n", "<leader>jj", "<cmd>JupyterConnect<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>jd", "<cmd>JupyterDisconnect<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>jf", "<cmd>JupyterRunFile<CR>", opts)

vim.api.nvim_buf_set_keymap(0, "n", "<leader>c", "<cmd>JupyterSendCell<cr>", opts)
-- workaround send range in visual mode
-- exits and enters visual mode to set '< and '>
-- note that it also sets a mark in 'j, so may override whatever may be there
vim.api.nvim_buf_set_keymap(0, "v", "<leader>c", "mjvv<cmd>'<,'>JupyterSendRange<cr>v'j", opts)

vim.api.nvim_buf_set_keymap(0, "n", "#u", "o<CR><CR>###<esc>kk", opts)
vim.api.nvim_buf_set_keymap(0, "n", "#e", "i###<CR><CR><esc>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "#i", "i###<CR><CR><CR><CR>###<esc>kk", opts)
vim.api.nvim_buf_set_keymap(0, "n", "#d", "/###<CR>dN:noh<CR>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "##", "i###<esc>", opts)
