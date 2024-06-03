return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = {
		{ "N", "<cmd>Oil --float<CR>", desc = "Open parent directory" },
	},
	opts = {
		keymaps = {
			["<CR>"] = "actions.select",
			["S"] = "actions.change_sort",
			["N"] = "actions.close",
			["R"] = "actions.refresh",
			["P"] = "actions.preview",
			["X"] = "actions.open_cmdline",
			["T"] = "actions.open_terminal",
			["Y"] = "actions.preview_scroll_down",
			["L"] = "actions.preview_scroll_up",
			["g?"] = "actions.show_help",
			["gi"] = function()
				require("oil").set_columns({
					{ "permissions", highlight = "@attribute" },
					{ "mtime", format = "%Y-%m-%d %H:%M", highlight = "@function" },
					{ "size", highlight = "@keyword" },
					"icon",
				})
			end,
			["gn"] = function()
				require("oil").set_columns({ "icon" })
				require("oil").set_sort({ { "type", "asc" } })
			end,
			["gs"] = function()
				require("oil").set_columns({ { "size", highlight = "@keyword" }, "icon" })
				require("oil").set_sort({ { "type", "asc" }, { "size", "desc" } })
			end,
			["gm"] = function()
				require("oil").set_columns({
					{ "mtime", format = "mod: %Y-%m-%d %H:%M", highlight = "@function" },
					"icon",
				})
				require("oil").set_sort({ { "type", "asc" }, { "mtime", "desc" } })
			end,
			["gc"] = function()
				require("oil").set_columns({
					{ "ctime", format = "created: %Y-%m-%d %H:%M", highlight = "@function" },
					"icon",
				})
				require("oil").set_sort({ { "type", "asc" }, { "ctime", "desc" } })
			end,
			["ga"] = function()
				require("oil").set_columns({
					{ "atime", format = "accessed: %Y-%m-%d %H:%M", highlight = "@function" },
					"icon",
				})
				require("oil").set_sort({ { "type", "asc" }, { "atime", "desc" } })
			end,
		},
		view_options = { show_hidden = true },
	},
}
