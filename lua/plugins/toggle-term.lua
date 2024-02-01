-- docs: https://github.com/akinsho/toggleterm.nvim

return {
	"akinsho/toggleterm.nvim",
	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<c-;>]], -- dead command. can't do <c-;>
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		})

		-- declare global functions
		local Terminal = require("toggleterm.terminal").Terminal

		local curr_term_fn = nil

		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
		_LAZYGIT_TOGGLE = function()
			curr_term_fn = _LAZYGIT_TOGGLE
			lazygit:toggle()
		end
		curr_term_fn = _LAZYGIT_TOGGLE

		_TOGGLE_CURRENT = function()
			curr_term_fn()
		end

		_TERMINAL_TOGGLE = function()
			curr_term_fn = _TERMINAL_TOGGLE
			vim.cmd("ToggleTerm")
		end

		local node = Terminal:new({ cmd = "node", hidden = true })
		_NODE_TOGGLE = function()
			curr_term_fn = _NODE_TOGGLE
			node:toggle()
		end

		local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
		_NCDU_TOGGLE = function()
			curr_term_fn = _NCDU_TOGGLE
			ncdu:toggle()
		end

		local htop = Terminal:new({ cmd = "htop", hidden = true })
		_HTOP_TOGGLE = function()
			curr_term_fn = _HTOP_TOGGLE
			htop:toggle()
		end

		local python = Terminal:new({ cmd = "python", hidden = true })
		_PYTHON_TOGGLE = function()
			curr_term_fn = _PYTHON_TOGGLE
			python:toggle()
		end
	end,

	keys = {
		{ "<C-x>t", "<cmd>lua _TERMINAL_TOGGLE()<cr>" },
		{ "<C-x>g", "<cmd>lua _LAZYGIT_TOGGLE()<cr>" },
		{ "<C-x>n", "<cmd>lua _NODE_TOGGLE()<cr>" },
		{ "<C-x>s", "<cmd>lua _NCDU_TOGGLE()<cr>" },
		{ "<C-x>h", "<cmd>lua _HTOP_TOGGLE()<cr>" },
		{ "<C-x>p", "<cmd>lua _PYTHON_TOGGLE()<cr>" },
		{ "<C-q>", "<cmd>lua _TOGGLE_CURRENT()<cr>", desc = "Toggle terminal" },
		{ "<C-q>", "<cmd>lua _TOGGLE_CURRENT()<cr>", mode = "t" },
	},
}
