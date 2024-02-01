return {
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

	{ -- Easily comment stuff
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				-- options: https://github.com/numToStr/Comment.nvim#configuration-optional
				-- :h comment.config
				mappings = { basic = true, extra = false },
			})
		end,
		lazy = false,
		keys = {
			{
				"<leader>/",
				"gc",
				mode = "v",
				remap = true,
				desc = "Toggle comment",
			},
			{
				"<leader>/",
				"gcc",
				mode = "n",
				remap = true,
				desc = "Toggle comment",
			},
		},
	},
}
