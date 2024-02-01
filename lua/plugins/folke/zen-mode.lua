return {
	{ "folke/twilight.nvim" },
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>z",
				function()
					require("zen-mode").toggle({
						window = {
							width = 0.85,
						},
					})
				end,
			},
		},
	},
}
