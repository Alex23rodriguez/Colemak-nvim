return {
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	{
		"nvim-telescope/telescope.nvim",

		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			telescope.setup({
				defaults = {
					prompt_prefix = " ",
					selection_caret = " ",
					path_display = { "smart" },
					mappings = {
						i = {
							-- ["<C-n>"] = actions.cycle_history_next,
							-- ["<C-p>"] = actions.cycle_history_prev,

							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-c>"] = actions.close,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							-- ["<C-u>"] = actions.preview_scrolling_up,
							-- ["<C-d>"] = actions.preview_scrolling_down,

							-- ["<PageUp>"] = actions.results_scrolling_up,
							-- ["<PageDown>"] = actions.results_scrolling_down,

							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							-- ["<C-l>"] = actions.complete_tag, -- disabled because conflicted with my resizing keybindings
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
						},
						n = {
							["<esc>"] = actions.close,
							["<CR>"] = actions.select_default,
							["h"] = actions.select_horizontal,
							["v"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
							["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
							["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["e"] = actions.cycle_history_next,
							["u"] = actions.cycle_history_prev,
							["H"] = actions.move_to_top,
							["M"] = actions.move_to_middle,
							["L"] = actions.move_to_bottom,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["gg"] = actions.move_to_top,
							["G"] = actions.move_to_bottom,
							-- ["<C-u>"] = actions.preview_scrolling_up,
							-- ["<C-d>"] = actions.preview_scrolling_down,

							-- ["<PageUp>"] = actions.results_scrolling_up,
							-- ["<PageDown>"] = actions.results_scrolling_down,

							["?"] = actions.which_key,
						},
					},
				},
				pickers = {
					-- Default configuration for builtin pickers goes here:
					-- picker_name = {
					--   picker_config_key = value,
					--   ...
					-- }
					-- Now the picker_config_key will be applied every time you call this
					-- builtin picker
				},
				extensions = {
					-- Your extension configuration goes here:
					-- extension_name = {
					--   extension_config_key = value,
					-- }
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg", "mp3" },
						find_cmd = "rg", -- find command (defaults to `fd`)
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					-- please take a look at the readme of the extension you want to configure
				},
			})

			telescope.load_extension("harpoon")
			telescope.load_extension("media_files")
			-- telescope.load_extension("projects")
			telescope.load_extension("fzf")
			telescope.load_extension("live_grep_args") -- https://github.com/nvim-telescope/telescope-live-grep-args.nvim
			telescope.load_extension("aerial")
			telescope.load_extension("yank_history")
		end,

		keys = {

			-- view more here: https://github.com/nvim-telescope/telescope.nvim
			{ "<leader>f", "<cmd>Telescope find_files<cr>" },
			{ "<leader>F", "<cmd>Telescope find_files hidden=true<cr>" },

			{ "<leader>p", "<cmd>Telescope oldfiles only_cwd=true no_ignore=true<cr>" },

			{ "<leader>b", "<cmd>Telescope buffers<cr>" },
			{ "<leader>?", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
			{ "<leader>g", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>" },
			{ "<leader>'", "<cmd>Telescope marks theme=ivy<cr>" },
			-- { "<leader>y", "<cmd>Telescope registers theme=ivy<cr>" },
			{ "<leader>y", "<cmd>Telescope yank_history<cr>" },
			{ "<leader>[", "<cmd>Telescope diagnostics theme=ivy<cr>" },
			{
				"<leader>t",
				"<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
			},

			-- lsp
			{ "gr", "<cmd>Telescope lsp_references<cr>" },
			{
				"<leader>lr",
				"<cmd>Telescope lsp_references<cr>",
				desc = "references",
			},
			{
				"<leader>ld",
				"<cmd>Telescope lsp_definitions<cr>",
				desc = "definitions",
			},
			{
				"<leader>lo",
				"<cmd>Telescope lsp_outgoing_calls<cr>",
				desc = "outgoing calls",
			},
			{
				"<leader>ly",
				"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
				desc = "dynamic workspace symbols",
			},
			{
				"<leader>lw",
				"<cmd>Telescope lsp_workspace_symbols<cr>",
				desc = "workspace symbols",
			},
			{
				"<leader>ls",
				"<cmd>Telescope lsp_document_symbols<cr>",
				desc = "document symbols",
			},
			{
				"<leader>li",
				"<cmd>Telescope lsp_implementations<cr>",
				desc = "implementations",
			},
			{
				"<leader>lt",
				"<cmd>Telescope lsp_type_definitions<cr>",
				desc = "type definitions",
			},
			{
				"<leader>ln",
				"<cmd>Telescope lsp_incoming_calls<cr>",
				desc = "incoming calls",
			},
		},
	},
}
