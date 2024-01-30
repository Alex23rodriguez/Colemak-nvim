return {
	"AckslD/nvim-pytrize.lua",
	config = function()
		require("pytrize").setup({ no_commands = true })
	end,
	keys = {
		{
			"gF",
			"<cmd>lua require('pytrize.api').jump_fixture()<cr>",
			ft = "python",
			desc = "Pytrize: Jump to Fixture",
		},
	},
}
