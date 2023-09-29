-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
local on_attach = require("user.nvim-tree.nvim-tree-on-attach")
require("nvim-tree").setup({
	-- BEGIN_DEFAULT_OPTS
	on_attach = on_attach,
	git = {
		enable = true,
		ignore = false,
	},
	respect_buf_cwd = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 30,
		--[[ height = 30, ]]
		-- hide_root_folder = false,
		side = "left",
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	trash = {
		cmd = "sh ~/Documents/Code/Scripts/trash.sh",
		require_confirm = true,
	},
	renderer = {
		icons = {
			show = {
				git = true,
			},
			glyphs = {
				git = {
					unstaged = "M",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})

-- autoclose functionality
--[[
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})
--]]
