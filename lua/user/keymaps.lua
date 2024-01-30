-- references:
-- https://github.com/nanotee/nvim-lua-guide
-- https://neovim.io/doc/user/api.html#nvim_set_keymap()

local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   nvso_modes = "",
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NVSO --
-- Colemak movement
keymap("", "u", "k", opts)
keymap("", "n", "h", opts)
keymap("", "e", "j", opts)
-- keymap("", "i", "l", opts) -- this one only for normal and visual modes
keymap("", "j", "e", opts)
keymap("", "k", "n", opts)
keymap("", "K", "N", opts)

keymap("", "E", "5j", opts)
keymap("", "U", "5k", opts)

keymap("", "S", "z", opts)

-- Normal --
-- Colemak settings
-- i is remaped only in normal mode to keep "inside"
keymap("n", "i", "l", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

-- turbomove
keymap("", "E", "5j", opts)
keymap("", "U", "5k", opts)

-- vim-indentwise
-- these are the default mappings. They are here as a remeinder
--[[ map [- <Plug>(IndentWisePreviousLesserIndent) ]]
--[[ map [= <Plug>(IndentWisePreviousEqualIndent) ]]
--[[ map [+ <Plug>(IndentWisePreviousGreaterIndent) ]]
--[[ map ]- <Plug>(IndentWiseNextLesserIndent) ]]
--[[ map ]= <Plug>(IndentWiseNextEqualIndent) ]]
--[[ map ]+ <Plug>(IndentWiseNextGreaterIndent) ]]
--[[ map [_ <Plug>(IndentWisePreviousAbsoluteIndent) ]]
--[[ map ]_ <Plug>(IndentWiseNextAbsoluteIndent) ]]
--[[ map [% <Plug>(IndentWiseBlockScopeBoundaryBegin) ]]
--[[ map ]% <Plug>(IndentWiseBlockScopeBoundaryEnd) ]]
-- ultra quick vertical movement
--[[ keymap("n", "L", "<PageUp>zz", opts) ]]
--[[ keymap("n", "Y", "<PageDown>zz", opts) ]]
keymap("", "L", "25k", opts)
keymap("", "Y", "25j", opts)

-- Move current line ala vscode
keymap("n", "<A-u>", ":m .-2<CR>==", opts) -- == indents line if necessary
keymap("n", "<A-e>", ":m .+1<CR>==", opts)
-- insert mode --
keymap("i", "<A-u>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<A-e>", "<Esc>:m .+1<CR>==gi", opts)
-- Visual Block --
keymap("x", "<A-e>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-u>", ":move '<-2<CR>gv-gv", opts)

-- better jump hist with alt at Colemak n and i
keymap("n", "<A-n>", "<C-o>", opts)
keymap("n", "<A-i>", "<C-i>", opts)

-- Accents (choose one of the two)
-- keymap("i", "<C-o>", "<C-k>", opts) -- use now free <C-o> for diagraphs (<C-k> is used by tmux)
keymap("i", "<C-o>", "<C-k>'", opts) -- use now free <C-o> for accents (<C-k> is used by tmux)

-- remap undo and redo to z and Z
keymap("n", "z", "u", opts)
keymap("n", "Z", "<C-r>", opts)
--
-- remap S to z because z is used for undo
keymap("", "S", "z", opts)
-- remap leader z to center screen
keymap("n", "<leader>z", "zz", opts)

-- remap shift-enter to enter empty line. Need to modify terminal behavior: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
keymap("n", "<S-CR>", "o<esc>", opts)
keymap("i", "<S-CR>", "<C-o>o", opts)

-- Colemak window navigation
keymap("", "<C-n>", "<C-w>h", opts)
keymap("", "<C-e>", "<C-w>j", opts)
keymap("", "<C-u>", "<C-w>k", opts)
keymap("", "<C-i>", "<C-w>l", opts)
keymap("", "<C-j>", "<C-w>l", opts) -- maybe necessary because of <tab> conflict

keymap("", "sN", "<C-w>h", opts)
keymap("", "sE", "<C-w>j", opts)
keymap("", "sU", "<C-w>k", opts)
keymap("", "sI", "<C-w>l", opts)

-- Navigate buffers
-- ":buffers" or ":ls" to get a list of buffers
keymap("n", "l", "<cmd>BufferLinePick<CR>", opts) -- pick a buffer
keymap("n", "ss", ":b#<CR>", opts) -- go back to previous file
keymap("n", "si", "<cmd>BufferLineCycleNext<CR>", opts)
keymap("n", "sn", "<cmd>BufferLineCyclePrev<CR>", opts)
keymap("n", "sl", "<cmd>BufferLineMovePrev<CR>", opts)
keymap("n", "sy", "<cmd>BufferLineMoveNext<CR>", opts)

-- Harpoon navigation
keymap("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
keymap("n", "<leader>a", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap("n", "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", opts)
keymap("n", "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", opts)
keymap("n", "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", opts)
keymap("n", "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", opts)
keymap("n", "<leader>7", "<cmd>lua require('harpoon.term').gotoTerminal(1)<CR>", opts)
keymap("n", "<leader>8", "<cmd>lua require('harpoon.term').gotoTerminal(2)<CR>", opts)
keymap("n", "<leader>9", "<cmd>lua require('harpoon.term').gotoTerminal(3)<CR>", opts)
keymap("n", "<leader>0", "<cmd>lua require('harpoon.term').gotoTerminal(4)<CR>", opts)

-- manage buffers and windows
keymap("n", "<c-w>", "<cmd>Bdelete<cr>", opts)
keymap("n", "s", "<c-w>", opts) -- to access normal window commands
keymap("n", "sx", "<c-w>x", opts) -- Swap current window with N window (default next)

keymap("n", "sh", "<c-w>s", opts) -- split horizontally

keymap("n", "sv", "<c-w>v", opts) -- redundant. split vertically
keymap("n", "sd", "<c-w>d", opts) -- redundant. split and go to def
keymap("n", "sgt", "<c-w>gt", opts) -- redundant. go to next tab
keymap("n", "sgT", "<c-w>gT", opts) -- redundant. go to prev tab
keymap("n", "so", "<c-w>o", opts) -- redundant. close all but current window (zen mode lol)
keymap("n", "sW", ":%bd|e#<CR>", opts) --  close all but current buffer
keymap("n", "sw", ":Bd<CR>", opts) --  close current buffer
keymap("n", "sz", "<c-w>z", opts) -- redundant. close preview window
keymap("n", "sq", "<c-w>q", opts) -- redundant. quit current window (like :quit)

keymap("n", "gA", "<cmd>Alpha<cr>", opts)

-- Normal --
-- Colemak settings
keymap("n", "i", "l", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

-- misc
keymap("n", "gs", "<cmd>source %<cr><cmd>echo 'file sourced!'<cr>", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- QuickFix
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprev<CR>", opts)
-- keymap("n", "<C-q>", ":call QuickFixToggle<CR>", opts)

-- Visual --
keymap("v", "i", "l", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- when pasting over something, don't override register
keymap("v", "p", '"_dP', opts)

-- leader keymaps
-- Format
keymap("n", "<leader>F", ":Format<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope commands
-- view more here: https://github.com/nvim-telescope/telescope.nvim
-- maybe useful: help_tags, treesitter, lsp_definitions, symbols
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap(
	"n",
	"/",
	"<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
keymap("n", "<leader>g", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references theme=ivy<cr>", opts)
keymap("n", "<leader>'", "<cmd>Telescope marks theme=ivy<cr>", opts)
keymap("n", "<leader>y", "<cmd>Telescope registers theme=ivy<cr>", opts)
keymap("n", "<leader>[", "<cmd>Telescope diagnostics theme=ivy<cr>", opts)
keymap(
	"n",
	"<leader>t",
	"<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
	opts
)
-- keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opts)

-- Debugger
-- dap
keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require('dap').step_over()<cr>", opts)
keymap("n", "<leader>dn", "<cmd>lua require('dap').step_back()<cr>", opts)
keymap("n", "<leader>de", "<cmd>lua require('dap').step_into()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require('dap').step_out()<cr>", opts)
keymap("n", "<leader>dE", "<cmd>lua require('dap').down()<cr>", opts)
keymap("n", "<leader>dU", "<cmd>lua require('dap').up()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>", opts)
keymap("n", "<leader>dp", "<cmd>lua require('dap').pause()<cr>", opts)
keymap("n", "<leader>dk", "<cmd>lua require('dap').terminate()<cr>", opts)
-- dapui
keymap("n", "<leader>dg", "<cmd>lua require('dapui').toggle()<cr>", opts) -- remember: gui
