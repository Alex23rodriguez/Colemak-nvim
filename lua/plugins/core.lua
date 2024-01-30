return {
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

	{ -- Easily comment stuff
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({
				-- options: https://github.com/numToStr/Comment.nvim#configuration-optional
				-- :h comment.config
				mappings = false,
			})
		end,
		lazy = false,
		keys = {
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise()
				end,
				mode = "n",
				desc = "Toggle comment",
			},
			{
				"<leader>/",
				function()
					require("Comment.api").toggle.linewise(vim.fn.visualmode())
				end,
				mode = "v",
				desc = "Toggle comment",
			},
		},
	},
}
