-- check out some tips on vimtex: https://ejmastnak.github.io/tutorials/vim-latex/compilation.html
vim.cmd("let g:vimtex_mappings_enabled = 0")
vim.cmd("let g:vimtex_view_method = 'skim'")
vim.cmd("let g:vimtex_view_skim_activate = 1")
vim.cmd("let g:vimtex_view_skim_reading_bar = 1")
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ll", "<cmd>VimtexCompile<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>lv", "<cmd>VimtexView<cr>", opts)

--[[
VimTeX makes it easy to filter out undesirable warning messages produced during LaTeX compilation. To do so, use the variable g:vimtex_quickfix_ignore_filters 
to define a set of Vim regular expression filters; the compilation messages that match these filters will then disappear from the QuickFix menu. 
See :help regular-expression for a review of Vim’s regular expression syntax; here are some examples to get you started:

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull \\hbox',
      \ 'Overfull \\hbox',
      \ 'LaTeX Warning: .\+ float specifier changed to',
      \ 'LaTeX hooks Warning',
      \ 'Package siunitx Warning: Detected the "physics" package:',
      \ 'Package hyperref Warning: Token not allowed in a PDF string',
      \]
--]]
