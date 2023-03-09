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
plugins = {
	-- core
	"folke/lazy.nvim", -- Have packer manage itself
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

	-- misc
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"akinsho/bufferline.nvim",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"gennaro-tedesco/nvim-jqx",
	"lewis6991/impatient.nvim",
	"norcalli/nvim-colorizer.lua",

	-- motion
	"jeetsukumaran/vim-indentwise",
	{ "unblevable/quick-scope", enabled = false },
	"tpope/vim-surround",

	-- navigation
	"ThePrimeagen/harpoon", --[[ https://github.com/ThePrimeagen/harpoon ]]
	"goolord/alpha-nvim",
	"ahmedkhalf/project.nvim",
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

	-- Colorschemes
	"lunarvim/colorschemes",
	"mangeshrex/everblush.vim",
	"folke/tokyonight.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"p00f/nvim-ts-rainbow",
	"nvim-treesitter/playground",
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- Git
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",
	"ruifm/gitlinker.nvim",

	-- Web dev
	"windwp/nvim-ts-autotag", --[[ autoclose tags in jsx and html https://github.com/windwp/nvim-ts-autotag ]]

	-- Python
	"jupyter-vim/jupyter-vim",

	-- LaTeX
	"lervag/vimtex",

	-- Debugging
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"mfussenegger/nvim-dap-python",

	-- SSH
	-- plugin to copy across ssh
	"ojroques/nvim-osc52",
}

opts = {}

lazy.setup(plugins, opts)
