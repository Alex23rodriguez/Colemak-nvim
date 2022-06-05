local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end
neogit.setup({
  kind = "split",
  mappings = {

    status = {
      ["Tab"] = "Toggle",
      ["$"] = "CommandHistory",
      ["b"] = "BranchPopup",
      ["a"] = "Stage", -- defualt s
      ["A"] = "StageUnstaged", -- default S
      ["<C-a>"] = "StageAll", -- defaunt <C-s>
      ["x"] = "Unstage", -- default u
      ["X"] = "UnstageStaged", -- default U
      ["c"] = "CommitPopup",
      ["r"] = "RebasePopup",
      ["L"] = "LogPopup",
      ["p"] = "PullPopup",
      ["P"] = "PushPopup",
      ["Z"] = "StashPopup",
      ["?"] = "HelpPopup",
      ["D"] = "Discard", -- default x
      ["<enter>"] = "GoToFile",
      ["<C-r>"] = "RefreshBuffer",

      ["u"] = "",
      ["U"] = "",
      ["s"] = "",
      ["S"] = "",
      -- ["x"] = "",
    },
  },
})
