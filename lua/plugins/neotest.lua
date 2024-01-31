return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			-- add adapters here
			"nvim-neotest/neotest-python",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
				},
			})
		end,
		keys = {
			{
				"<leader>TT",
				function()
					vim.cmd.write()
					require("neotest").run.run()
				end,
				desc = "Test nearest",
			},
			{
				"<leader>TF",
				function()
					vim.cmd.write()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				desc = "Test file",
			},
			{
				-- remember to install debugpy when testing in python!
				"<leader>TD",
				function()
					vim.cmd.write()
					require("neotest").run.run({ strategy = "dap" })
				end,
				desc = "Test nearest in debug mode",
			},
			{
				"<leader>TK",
				function()
					require("neotest").run.stop()
				end,
				desc = "Kill test",
			},
			{
				"<leader>TA",
				function()
					require("neotest").run.attach()
				end,
				desc = "Attach test",
			},
		},
	},
}
