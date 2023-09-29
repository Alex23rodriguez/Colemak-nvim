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

-- manually attach other lsp servers
local configs = require("lspconfig.configs")
if not configs.uiua then
	configs.uiua = {
		default_config = {
			cmd = { "uiua", "lsp" },
			root_dir = lspconfig.util.root_pattern(".git"),
			-- root_dir = vim.fn.getcwd(),
			filetypes = { "uiua" },
		},
	}
end
lspconfig.uiua.setup({})

-- null-ls for diagnostics and formatting
require("user.lsp.null-ls")
require("user.lsp.config")
require("user.lsp.lsp-keymaps")
