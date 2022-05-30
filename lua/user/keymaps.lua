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

-- Normal --
-- Colemak settings
keymap("n", "i", "l", opts)
keymap("n", "z", "u", opts)
keymap("n", "Z", "<C-r>", opts)
keymap("n", "<CR>", "i", opts)

-- Move current line ala vscode
keymap("n", "<A-u>", ":m .-2<CR>==", opts)
keymap("n", "<A-e>", ":m .+1<CR>==", opts)

-- better jump hist at Querty's U and O
keymap("n", "L", "<C-o>", opts)
keymap("n", "Y", "<C-i>", opts)


-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "l", ":bnext<CR>", opts)
-- keymap("n", "L", ":bprevious<CR>", opts) -- TODO find good mapping for this

-- QuickFix
keymap("n", "]q", ":cnext<CR>", opts)
keymap("n", "[q", ":cprev<CR>", opts)
-- keymap("n", "<C-q>", ":call QuickFixToggle<CR>", opts)

-- Insert --
-- Move current line ala vscode
keymap("i", "<A-u>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<A-e>", "<Esc>:m .+1<CR>==gi", opts)
-- Press jk fast to exit insert mode
keymap("i", "kk", "<ESC>", opts)

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
