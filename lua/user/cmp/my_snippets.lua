-- more documentation here: https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md
local ls = require("luasnip")

-- This is a snippet creator:
-- s(<trigger>, <nodes>)
local s = ls.s
--[[ s accepts, as the first argument, a table with the following possible entries:
    trig: string, plain text by default. The only entry that must be given.
    name: string, can be used by e.g. nvim-compe to identify the snippet.
    dscr: string, description of the snippet, \n-separated or table for multiple lines.
    wordTrig: boolean, if true, the snippet is only expanded if the word ([%w_]+) before the cursor matches the trigger entirely. True by default.
    regTrig: boolean, whether the trigger should be interpreted as a lua pattern. False by default.
    docstring: string, textual representation of the snippet, specified like dscr. Overrides docstrings loaded from json.
    docTrig: string, for snippets triggered using a lua pattern: define the trigger that is used during docstring-generation.
    hidden: hint for completion-engines, if set, the snippet should not show up when querying snippets.
    priority: Priority of the snippet, a positive number, 1000 by default. Snippets with high priority will be matched to a trigger before those with a lower one. The priority for multiple snippets can also be set in add_snippets.

    s can also be a single string, in which case it is used instead of trig, all other values being defaulted

    The second argument to s is a table containing all nodes that belong to the snippet. If the table only has a single node, it can be passed directly without wrapping it in a table.

    s also takes an optional third argument (opts), which is a table with the following valid keys:

    condition: the condition-function fn(line_to_cursor, matched_trigger, captures) -> bool. The snippet will be expanded only if it returns true (default is a function that just returns true). The function is called before the text is modified in any way. Some parameters are passed to the function: The line up to the cursor, the matched trigger, and the captures (table).
    show_condition: Function with signature f(line_to_cursor) -> bool. It is a hint for completion-engines, indicating when the snippet should be included in current completion candidates. Defaults to a function returning true. This is different from condition because condition is evaluated by LuaSnip on snippet expansion (and thus has access to the matched trigger and captures), while show_condition is evaluated by the completion-engine when scanning for available snippet candidates.
    callbacks: Contains functions that are called upon enterin/leaving a node of this snippet. To print text upon entering the second node of a snippet, callbacks should be set as follows:
]]

-- This is a format node.
-- It takes a format strin, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

local i = ls.insert_node
local t = ls.text_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep -- repeat node

ls.add_snippets("all", {
  -- snippets for all filetypes
  s("trn", fmt("{} ? {} : {}", { i(1, "cond"), i(2, "true"), i(3, "false") })),
})

local webdev_snips = {
  -- anonymous function
  s("af", fmt("({}) => {{{}}}", { i(1), i(2) })),
}

for _, lang in pairs({ "javascript", "typescript", "typescriptreact" }) do
  for _, snip in pairs(webdev_snips) do
    ls.add_snippets(lang, webdev_snips)
  end
end

ls.add_snippets("tex", {
  s("it", fmt("\\textit{{{}}}", i(1))),
  s("bold", fmt("\\textbf{{{}}}", i(1))),
  s("mono", fmt("\\texttt{{{}}}", i(1))),
  s("href", fmt("\\href{{{}}}{{{}}}", { i(1, "url"), i(2, "placeholder") })),
})

ls.add_snippets("bib", {
  s(
    "article",
    fmt(
      "@article{{{},\n  title={{{}}},\n  author={{{}}},\n  journal={{{}}},\n  volume={{{}}},\n  number={{{}}},\n  pages={{{}}},\n  year={{{}}},\n  publisher={{{}}}\n}}"
      ,
      {
        i(1, "latexref"),
        i(2, "str"),
        i(3, "last,first [and]"),
        i(4, "str"),
        i(5, "int"),
        i(6, "int"),
        i(7, "int--int"),
        i(8, "int"),
        i(9, "str"),
      }
    )
  ),
  s(
    "misc",
    fmt(
      "@misc{{{},\n  title={{{}}},\n  url={{{}}},\n  howpublished={{{}}},\n  journal={{{}}},\n  author={{{}}},\n  publisher={{{}}},\n  year={{{}}},\n  month={{{}}}\n}}"
      ,
      {
        i(1, "latexref"),
        i(2, "str"),
        i(3, "href"),
        rep(3),
        i(4, "journal"),
        i(5, "last,first [and] / foundation"),
        i(6, "publisher"),
        i(7, "int"),
        i(8, "ccc"),
      }
    )
  ),
})
