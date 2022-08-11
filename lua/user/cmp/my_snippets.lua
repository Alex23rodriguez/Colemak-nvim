local ls = require("luasnip")

-- This is a snippet creator:
-- s(<trigger>, <nodes>)
local s = ls.s

-- This is a format node.
-- It takes a format strin, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("all", {
  -- snippets for all filetypes
  -- s("myreq", fmt("{}local {} = require('{}')\n{}", { i(0), i(1, "def"), rep(1), i(2) })),
})
