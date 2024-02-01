return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		filter_kind = false,
		nav = {
			keymaps = {
				n = "actions.left",
				i = "actions.right",
				["<esc>"] = "actions.close",
				v = "actions.jump_vsplit",
				h = "actions.jump_split",
			},
		},
	},
	keys = {
		-- { "{", "<cmd>AerialPrev<cr>" },
		-- { "}", "<cmd>AerialNext<cr>" },
		{ "<leader>A", "<cmd>AerialToggle!<cr>" },
		{ "<leader>a", "<cmd>AerialNavToggle<cr>" },
	},
}
