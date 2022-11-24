local opts = { noremap = true, silent = true }

vim.opt.wrap = true -- display lines as one long line
vim.opt.spell = true
vim.opt.spelllang = "es,en"
vim.api.nvim_set_keymap("i", "<C-l>", "<c-g>u<Esc>[s1z=`]a<c-g>u", opts)
vim.opt.textwidth = 106
