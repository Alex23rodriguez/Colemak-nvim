local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- remap shift-enter to enter empty line. Need to modify terminal behavior: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
keymap("n", "<S-CR>", "o<esc>", opts)

-- Normal --
-- Colemak settings
keymap("n", "i", "l", opts)
-- remap undo and redo to z and Z
keymap("n", "z", "u", opts)
keymap("n", "Z", "<C-r>", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

-- Move current line ala vscode
keymap("n", "<A-u>", ":m .-2<CR>==", opts)
keymap("n", "<A-e>", ":m .+1<CR>==", opts)

-- better jump hist at Querty's U and O
keymap("n", "L", "<C-o>", opts)
keymap("n", "Y", "<C-i>", opts)


-- Better window navigation
keymap("n", "s", "<Nop>", opts)

keymap("", "sn", "<C-w>h", opts)
keymap("", "se", "<C-w>j", opts)
keymap("", "su", "<C-w>k", opts)
keymap("", "si", "<C-w>l", opts)

keymap("n", "sv", "<cmd>vsplit<cr>", opts)
keymap("n", "sh", "<cmd>split<cr>", opts)


keymap("n", "sI", "<C-w>x", opts)
keymap("n", "sr", "<C-w>r", opts)

keymap("", "E", "5j", opts)
keymap("", "U", "5k", opts)

keymap("", "S", "z", opts)

-- remap shift-enter to enter empty line. Need to modify terminal behavior: https://stackoverflow.com/questions/16359878/how-to-map-shift-enter
keymap("n", "<S-CR>", "o<esc>", opts)

-- Normal --
-- Colemak settings
keymap("n", "i", "l", opts)
-- remap undo and redo to z and Z
keymap("n", "z", "u", opts)
keymap("n", "Z", "<C-r>", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

-- Move current line ala vscode
keymap("n", "<A-u>", ":m .-2<CR>==", opts)
keymap("n", "<A-e>", ":m .+1<CR>==", opts)

-- better jump hist at Querty's U and O
keymap("n", "L", "<C-o>", opts)
keymap("n", "Y", "<C-i>", opts)


-- Better window navigation
keymap("n", "s", "<Nop>", opts)

keymap("n", "sn", "<C-w>h", opts)
keymap("n", "se", "<C-w>j", opts)
keymap("n", "su", "<C-w>k", opts)
keymap("n", "si", "<C-w>l", opts)

keymap("n", "sv", "<cmd>vsplit<cr>", opts)
keymap("n", "sh", "<cmd>split<cr>", opts)


keymap("n", "sI", "<C-w>x", opts)
keymap("n", "sr", "<C-w>r", opts)
-- Navigate buffers
keymap("n", "l", ":bnext<CR>", opts)
keymap("n", "sl", ":bprev<CR>", opts)

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

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- leader keymaps
-- format
keymap("n", "<leader>f", ":Format<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope commands
-- view more here: https://github.com/nvim-telescope/telescope.nvim
-- maybe useful: help_tags, treesitter, lsp_definitions, symbols
keymap("n", "<leader>F", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope oldfiles<cr>", opts)
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>g", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "gr", "<cmd>Telescope lsp_references theme=ivy<cr>", opts)
keymap("n", "<leader>'", "<cmd>Telescope marks theme=ivy<cr>", opts)
keymap("n", "<leader>y", "<cmd>Telescope registers theme=ivy<cr>", opts)
keymap("n", "<leader>[", "<cmd>Telescope diagnostics theme=ivy<cr>", opts)
keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.builtin(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
-- keymap("n", "<leader>h", "<cmd>Telescope help_tags<cr>", opts)
