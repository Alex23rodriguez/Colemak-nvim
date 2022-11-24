local configs = require("nvim-treesitter.configs")
configs.setup({
  ensure_installed = {},
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autotag = {
    enable = true, --[[ autoclose tags in html and jsx (comes from nvim-ts-autotag) ]]
  },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
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
    disable = { "html", "tsx" },
  },
  playground = {
    enable = true,
  },
})
