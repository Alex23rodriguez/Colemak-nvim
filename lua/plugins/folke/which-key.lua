return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local presets = require("which-key.plugins.presets")
		presets.operators["zf"] = nil
		require("which-key").setup({
			plugins = {
				spelling = false,
			},
		})

		require("which-key").register({
			d = {
				name = "debugger",
			},
			g = {
				name = "git",
			},
			l = {
				name = "LSP",
			},
			T = {
				name = "Test",
			},
			x = {
				name = "trouble",
			},
		}, { prefix = "<leader>" })
	end,
}
