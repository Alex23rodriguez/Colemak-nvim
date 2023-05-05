require("mason").setup({})
require("mason-lspconfig").setup()

-- lua
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})
lspconfig.dockerls.setup({})

-- null-ls for diagnostics and formatting
require("user.lsp.null-ls")
require("user.lsp.config")
require("user.lsp.lsp-keymaps")
