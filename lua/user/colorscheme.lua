-- disable background for transparency, even when changing color schemes
vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

-- default select color for everblush is not very visible
-- vim colors: https://codeyarns.com/tech/2011-07-29-vim-chart-of-color-names.html
if colorscheme == "everblush" then
  vim.cmd("hi Visual guibg=DarkSlateGray")
end

-- change Diffview colors
--[[
local status_ok, diffview  = pcall(require, "diffview")
if not status_ok then
  print("colorscheme: diffview not found")
else
  vim.cmd "hi DiffAdd ctermbg=4 guibg=#283B4D"
  vim.cmd "hi DiffText cterm=bold ctermbg=9 guibg=#394b70"
  vim.cmd "hi DiffChange ctermbg=5 gui=underline guifg=171B21 guibg=#94151b"
  vim.cmd "hi DiffDelete ctermfg=12 ctermbg=6 gui=bold guifg=171B21 guibg=#94151b"
end
]]
