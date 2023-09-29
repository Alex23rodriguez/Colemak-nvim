-- -- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.ua",
	callback = function()
		vim.lsp.buf.format({ async = false })
		return true
	end,
})
