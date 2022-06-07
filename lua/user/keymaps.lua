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
keymap("n", "i", "l", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

-- Move current line ala vscode
keymap("n", "<A-u>", ":m .-2<CR>==", opts)
keymap("n", "<A-e>", ":m .+1<CR>==", opts)

-- better jump hist at Querty's U and O
keymap("n", "L", "<C-o>", opts)
keymap("n", "Y", "<C-i>", opts)

-- remap undo and redo to z and Z
keymap("n", "z", "u", opts)
keymap("n", "Z", "<C-r>", opts)

-- remap shift-enter to enter empty line. Need to modify terminal behavior: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
keymap("n", "<S-CR>", "o<esc>", opts)

-- Colemak window navigation
keymap("", "<C-n>", "<C-w>h", opts)
keymap("", "<C-e>", "<C-w>j", opts)
keymap("", "<C-u>", "<C-w>k", opts)
keymap("", "<C-i>", "<C-w>l", opts)
keymap("", "<C-j>", "<C-w>l", opts) -- maybe necessary because of <tab> conflict

keymap("n", "<c-w>", "<cmd>Bdelete<cr>", opts)
keymap("n", "s", "<c-w>", opts) -- to access normal window commands
keymap("n", "sh", "<c-w>s", opts)

-- turbomove
keymap("", "E", "5j", opts)
keymap("", "U", "5k", opts)

keymap("", "S", "z", opts)
keymap("n", "gA", "<cmd>Alpha<cr>", opts)

-- remap shift-enter to enter empty line. Need to modify terminal behavior: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
keymap("n", "<S-CR>", "o<esc>", opts)

-- Normal --
-- Colemak settings
keymap("n", "i", "l", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

-- Move current line ala vscode
keymap("n", "<A-u>", ":m .-2<CR>==", opts)
keymap("n", "<A-e>", ":m .+1<CR>==", opts)

-- better jump hist at Querty's U and O
keymap("n", "L", "<C-o>", opts)
keymap("n", "Y", "<C-i>", opts)

-- Navigate buffers
keymap("n", "l", ":bnext<CR>", opts)
keymap("n", "sl", ":bprev<CR>", opts)

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

-- Insert --
-- Move current line ala vscode
keymap("i", "<A-u>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<A-e>", "<Esc>:m .+1<CR>==gi", opts)
-- Press kk fast to exit insert mode
keymap("i", "kk", "<ESC>", opts)
keymap("i", "<S-CR>", "<C-o>o", opts)

-- Visual --
keymap("v", "i", "l", opts)
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- when pasting over something, don't override register
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-e>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-u>", ":move '<-2<CR>gv-gv", opts)

-- ToggleTerminal --
keymap("n", "<C-x>t", "<cmd>lua _TERMINAL_TOGGLE()<cr>", opts)
keymap("n", "<C-x>g", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "<C-x>n", "<cmd>lua _NODE_TOGGLE()<cr>", opts)
keymap("n", "<C-x>s", "<cmd>lua _NCDU_TOGGLE()<cr>", opts)
keymap("n", "<C-x>h", "<cmd>lua _HTOP_TOGGLE()<cr>", opts)
keymap("n", "<C-x>p", "<cmd>lua _PYTHON_TOGGLE()<cr>", opts)
keymap("n", "<C-q>", "<cmd>lua _TOGGLE_CURRENT()<cr>", opts)
keymap("t", "<C-q>", "<cmd>lua _TOGGLE_CURRENT()<cr>", opts)

-- leader keymaps
-- Format
keymap("n", "<leader>F", ":Format<cr>", opts)

-- Comment
keymap("", "<leader>/", "gc", { noremap = false, silent = true })
keymap("n", "<leader>/", "gcc", { noremap = false, silent = true })
--
-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope commands
-- view more here: https://github.com/nvim-telescope/telescope.nvim
-- maybe useful: help_tags, treesitter, lsp_definitions, symbols
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope oldfiles<cr>", opts)
keymap(
  "n",
  "/",
  "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
  opts
)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
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
