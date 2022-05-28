
-- disable background for transparency, even when changing color schemes
vim.cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"

local colorscheme = "everblush"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- default select color for everblush is not very visible
if colorscheme=="everblush" then
  vim.cmd "hi Visual guibg=DarkSlateGray"
end
