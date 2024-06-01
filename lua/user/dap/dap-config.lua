-- :h dap-api
require("dapui").setup({
	mappings = {
		edit = "E",
	},
})
require("nvim-dap-virtual-text").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

-- Debugger
-- dap
vim.keymap.set("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>")
vim.keymap.set("n", "<leader>dc", function()
	vim.cmd.write()
	require("dap").continue()
end)
vim.keymap.set("n", "<leader>di", "<cmd>lua require('dap').step_over()<cr>")
vim.keymap.set("n", "<leader>dn", "<cmd>lua require('dap').step_back()<cr>")
vim.keymap.set("n", "<leader>de", "<cmd>lua require('dap').step_into()<cr>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require('dap').step_out()<cr>")
vim.keymap.set("n", "<leader>dE", "<cmd>lua require('dap').down()<cr>")
vim.keymap.set("n", "<leader>dU", "<cmd>lua require('dap').up()<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<cr>")
vim.keymap.set("n", "<leader>dp", "<cmd>lua require('dap').pause()<cr>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require('dap').terminate()<cr>")
-- dapui
vim.keymap.set("n", "<leader>dg", "<cmd>lua require('dapui').toggle()<cr>")
