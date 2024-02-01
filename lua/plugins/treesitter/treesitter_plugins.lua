return {
	{

		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["la"] = "@assignment.lhs",
							["ra"] = "@assignment.rhs",
							["ia"] = "@assignment.inner",
							["aa"] = "@assignment.outer",
							["il"] = "@loop.inner",
							["ol"] = "@loop.outer",
							["ii"] = "@conditional.inner",
							["oi"] = "@conditional.outer",

							-- ["af"] = "@function.outer",
							-- ["if"] = "@function.inner",
							-- ["ac"] = "@class.outer",
							-- ["ic"] = "@class.inner",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>si"] = "@parameter.inner",
							["<leader>sy"] = "@function.outer",
						},
						swap_previous = {
							["<leader>sn"] = "@parameter.inner",
							["<leader>sl"] = "@function.outer",
						},
					},
				},
				playground = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = true,
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 20, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = "-",
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			})
		end,
		keys = {
			{
				"[c",
				function()
					require("treesitter-context").go_to_context(vim.v.count1)
				end,
			},
		},
	},
}
