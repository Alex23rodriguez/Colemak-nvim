-- format on save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.ua",
	callback = function(ev)
		vim.cmd("silent! !uiua fmt " .. ev.match)
		return true
	end,
})

vim.lsp.start({
	cmd = { "uiua", "lsp" },
	root_dir = vim.fn.getcwd(), -- Use PWD as project root dir.
})
