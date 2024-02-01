return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "{", "<cmd>AerialPrev<cr>" },
		{ "}", "<cmd>AerialNext<cr>" },
		{ "<leader>a", "<cmd>AerialToggle!<cr>" },
		{ "<leader>A", "<cmd>AerialNavToggle<cr>" },
	},
}
