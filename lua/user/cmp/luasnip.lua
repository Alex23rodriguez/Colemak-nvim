local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
  -- this tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- for dynamic snipets, to update as one types
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets
  enable_autosnippets = false,
})

-- <C-t> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<C-t>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <C-T> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({ "i", "s" }, "<M-S-t>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <C-d> is selecting within a list of options
-- This is useful for choice nodes
vim.keymap.set({ "i", "s" }, "<C-d>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- shortcut to source my snippets file, to reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/user/cmp/my_snippets.lua<CR>")
