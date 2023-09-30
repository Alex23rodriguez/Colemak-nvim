-- -- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.ua",
	callback = function()
		vim.lsp.buf.format({ async = false })
		-- return true
	end,
})

vim.cmd("setl commentstring=#%s")

local opts = { noremap = true, silent = true }
vim.api.nvim_buf_set_keymap(0, "n", "j", "d$O<esc>p", opts)
vim.api.nvim_buf_set_keymap(0, "n", "<A-j>", "ddpkJ", opts)
