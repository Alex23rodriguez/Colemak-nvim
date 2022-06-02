-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require 'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  git = {
    enable = true,
    ignore = false
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
        { key = { "<CR>", "o", "i" }, action = "edit" },
        -- { key = "<C-e>", action = "edit_in_place" },
        -- { key = "O", action = "edit_no_picker" },
        -- { key = "E", action = "expand_all" },
        { key = "E", action = "" },
        -- { key = "U", action = "toggle_custom" },
        { key = "U", action = "" },
        -- { key = "I", action = "toggle_git_ignored" },
        { key = "I", action = "full_rename" },
        { key = "O", action = "expand_all" },
        { key = "C", action = "collapse_all" },
        { key = "<C-]>", action = "cd" },
        { key = "v", action = "vsplit" },
        { key = "h", action = "split" },
        { key = "s", action = "" },
        { key = "a", action = "create" },
        { key = "y", action = "copy_name" },
        { key = "Y", action = "copy_path" },
        { key = "gy", action = "copy_absolute_path" },
        { key = "d", action = "remove" },
        { key = "D", action = "trash" },
        { key = "r", action = "rename" },
        { key = "<C-v>", action = "toggle_file_info" },
        { key = "<C-t>", action = "tabnew" },
        { key = "<", action = "prev_sibling" },
        { key = ">", action = "next_sibling" },
        { key = "P", action = "parent_node" },
        { key = { "<BS>", "n" }, action = "close_node" },
        { key = "<Tab>", action = "preview" },
        { key = "K", action = "first_sibling" },
        { key = "J", action = "last_sibling" },
        { key = "H", action = "toggle_dotfiles" },
        { key = "R", action = "refresh" },
        { key = "<C-r>", action = "full_rename" },
        { key = "x", action = "cut" },
        { key = "c", action = "copy" },
        { key = "p", action = "paste" },
        { key = "[c", action = "prev_git_item" },
        { key = "]c", action = "next_git_item" },
        { key = "-", action = "dir_up" },
        { key = "<C-o>", action = "system_open" },
        { key = "f", action = "live_filter" },
        { key = "F", action = "clear_live_filter" },
        { key = "q", action = "close" },
        { key = "W", action = "collapse_all" },
        { key = "S", action = "search_node" },
        { key = ".", action = "run_file_command" },
        { key = "?", action = "toggle_help" },
      },
    },
  },
  trash = {
    cmd = "!echo hello",
    require_confirm = true
  },
  renderer = {
    icons = {
      show = {
        git = true
      },
      glyphs = {
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },

      }
    }
  }
}

-- autoclose functionality
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd "quit"
    end
  end
})
