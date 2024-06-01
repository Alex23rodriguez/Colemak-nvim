-- null-ls for diagnostics and formatting
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black,
		diagnostics.ruff,
		formatting.stylua,
	},
	-- you can reuse a shared lspconfig on_attach callback here
	-- format synchronously on save:
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

-- setup sync Format command
vim.api.nvim_create_user_command("Format", function()
	vim.lsp.buf.format({ async = false })
	if vim.filetype.match({ buf = vim.api.nvim_get_current_buf() }) == "python" then
		vim.cmd("!ruff check --fix --select I %")
	end
end, { desc = "format the document and sort imports" })
