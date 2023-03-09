-- impatient: get faster load times
require("impatient")

-- ssh
local status_ok, osc52 = pcall(require, "osc52")
if not status_ok then
	print("osc52 not installed")
	return
end
-- to copy across ssh connection (requires tmux or some cool terminal)
vim.keymap.set("n", "<leader>Y", osc52.copy_operator, { expr = true })
vim.keymap.set("n", "<leader>YY", "<leader>Y_", { remap = true })
vim.keymap.set("x", "<leader>Y", osc52.copy_visual)
