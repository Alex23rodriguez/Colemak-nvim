return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		-- Lua
		{
			"<leader>xx",
			function()
				require("trouble").toggle()
			end,
		},
		{
			"<leader>xw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
		},
		{
			"<leader>xd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
		},
		{
			"<leader>xq",
			function()
				require("trouble").toggle("quickfix")
			end,
		},
		{
			"<leader>xl",
			function()
				require("trouble").toggle("loclist")
			end,
		},
		{
			"gR",
			function()
				require("trouble").toggle("lsp_references")
			end,
		},
	},
}
