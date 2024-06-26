-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

--- https://github.com/folke/lazy.nvim.git ---
--------- Install your plugins here ----------
local plugins = {
	-- core
	"folke/lazy.nvim", -- Have packer manage itself

	-- misc
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	-- { "kyazdani42/nvim-tree.lua", lazy = false }, --file explorer
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	-- { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	"gennaro-tedesco/nvim-jqx",
	"lewis6991/impatient.nvim",
	"norcalli/nvim-colorizer.lua",

	-- motion
	"jeetsukumaran/vim-indentwise",
	"tpope/vim-surround",

	-- navigation
	"ThePrimeagen/harpoon", --[[ https://github.com/ThePrimeagen/harpoon ]]
	-- "ahmedkhalf/project.nvim",
	"aserowy/tmux.nvim",

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	-- snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- LSP
	{ "neovim/nvim-lspconfig", lazy = false }, -- enable LSP
	{ "williamboman/mason.nvim", lazy = false },
	{ "williamboman/mason-lspconfig.nvim", lazy = false },
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-media-files.nvim",
	"nvim-telescope/telescope-live-grep-args.nvim",
	-- Colorschemes
	"lunarvim/colorschemes",
	"mangeshrex/everblush.vim",
	"folke/tokyonight.nvim",

	-- Treesitter
	{ import = "plugins/treesitter" },

	-- Web dev
	"windwp/nvim-ts-autotag", --[[ autoclose tags in jsx and html https://github.com/windwp/nvim-ts-autotag ]]

	-- Python
	"jupyter-vim/jupyter-vim",

	-- LaTeX
	"lervag/vimtex",

	-- Debugging
	"mfussenegger/nvim-dap",
	{ "rcarriga/nvim-dap-ui", dependencies = "nvim-neotest/nvim-nio" },
	"theHamsta/nvim-dap-virtual-text",
	"mfussenegger/nvim-dap-python",

	-- SSH
	-- plugin to copy across ssh
	"ojroques/nvim-osc52",

	-- rainbow csv plus RBQL
	{
		"cameron-wags/rainbow_csv.nvim",
		config = true,
		ft = {
			"csv",
			"tsv",
			"csv_semicolon",
			"csv_whitespace",
			"csv_pipe",
			"rfc_csv",
			"rfc_semicolon",
		},
		cmd = {
			"RainbowDelim",
			"RainbowDelimSimple",
			"RainbowDelimQuoted",
			"RainbowMultiDelim",
		},
	},

	-- all other plugins
	{
		import = "plugins",
	},
	{
		import = "plugins/folke",
	},
}

local opts = {}

lazy.setup(plugins, opts)
