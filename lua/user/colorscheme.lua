
-- disable background for transparency, even when changing color schemes
vim.cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"

local colorscheme = "onedarker"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- default select color for everblush is not very visible
-- vim colors: https://codeyarns.com/tech/2011-07-29-vim-chart-of-color-names.html
if colorscheme=="everblush" then
  vim.cmd "hi Visual guibg=DarkSlateGray"
end

-- change GitSigns colors
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end
