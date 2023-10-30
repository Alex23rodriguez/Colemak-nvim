-- OPTIONS
local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	cmdheight = 2, -- more space in the neovim command line for displaying messages
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "a", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	showtabline = 2, -- always show tabs
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = true, -- set numbered lines
	relativenumber = true, -- set relative numbered lines
	numberwidth = 4, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	wrap = false, -- display lines as one long line
	scrolloff = 8, -- is one of my fav
	sidescrolloff = 8,
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	foldmethod = "indent",
	foldenable = false,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- KEYMAPS
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
local nowait = { noremap = true, silent = true, nowait = true }
keymap("n", "z", "u", nowait)
keymap("n", "Z", "<C-r>", nowait)
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

keymap("n", "<c-w>", "<cmd>bdelete<cr>", opts)
keymap("n", "s", "<c-w>", opts) -- to access normal window commands
keymap("n", "sx", "<c-w>x", opts) -- Swap current window with N window (default next)

keymap("n", "sh", "<c-w>s", opts) -- split horizontally

keymap("n", "sv", "<c-w>v", opts) -- redundant. split vertically
keymap("n", "sd", "<c-w>d", opts) -- redundant. split and go to def
keymap("n", "sgt", "<c-w>gt", opts) -- redundant. go to next tab
keymap("n", "sgT", "<c-w>gT", opts) -- redundant. go to prev tab
keymap("n", "so", "<c-w>o", opts) -- redundant. close all but current window (zen mode lol)
keymap("n", "sW", ":%bd|e#<CR>", opts) --  close all but current buffer
keymap("n", "sw", ":Bd<CR>", opts) -- close current buffer
keymap("n", "sz", "<c-w>z", opts) -- redundant. close preview window
keymap("n", "sq", "<c-w>q", opts) -- reduntant. quit current window (like :quit)
-- more window navigation (for when ctl is not available)
keymap("n", "sN", "<C-w>h", opts) -- left
keymap("n", "sE", "<C-w>j", opts) -- down
keymap("n", "sU", "<C-w>k", opts) -- up
keymap("n", "sI", "<C-w>l", opts) -- right

-- Normal --
-- Colemak settings
keymap("n", "i", "l", opts)

-- remap enter to insert
keymap("n", "<CR>", "i", opts)

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

-- Format
keymap("n", "<leader>F", ":Format<cr>", opts)

-- Comment
keymap("", "<leader>/", "gc", { noremap = false, silent = true })
keymap("n", "<leader>/", "gcc", { noremap = false, silent = true })
--
-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
