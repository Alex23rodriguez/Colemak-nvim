local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = {},
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
		enable = true,
	},
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },

  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    colors = {
      "DeepSkyBlue",
      "Orchid",
      "DodgerBlue",
      -- "Cornsilk",
      -- "Salmon",
      -- "LawnGreen",
    },
    disable = { "html" },
  },
  playground = {
    enable = true,
  },
}
