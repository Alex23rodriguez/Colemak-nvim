require("tmux").setup({
  copy_sync = {
    enable = false,
  },
  navigation = {
    enable_default_keybindings = false,
  },
  resize = {
    enable_default_keybindings = false,
  },
})

local keymaps = require("tmux.keymaps")

keymaps.register("", {
  ["<C-n>"] = [[<cmd>lua require('tmux').move_left()<cr>]],
  ["<C-e>"] = [[<cmd>lua require('tmux').move_bottom()<cr>]],
  ["<C-u>"] = [[<cmd>lua require('tmux').move_top()<cr>]],
  ["<C-j>"] = [[<cmd>lua require('tmux').move_right()<cr>]],

  ["<C-l>"] = [[<cmd>lua require("tmux").resize_left()<cr>]],
  ["<C-y>"] = [[<cmd>lua require("tmux").resize_right()<cr>]],
  ["<A-l>"] = [[<cmd>lua require("tmux").resize_top()<cr>]],
  ["<A-y>"] = [[<cmd>lua require("tmux").resize_bottom()<cr>]],
})
