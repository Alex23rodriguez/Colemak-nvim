local opts = { noremap = true, silent = true }

vim.cmd("let g:jupyter_mapkeys = 0")
vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>JupyterSendCell<cr>", opts)
vim.api.nvim_set_keymap("v", "<leader>c", "<cmd>JupyterSendRange<cr>", opts)
