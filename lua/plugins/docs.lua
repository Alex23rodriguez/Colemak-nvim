return {
	"kkoomen/vim-doge",
	config = function()
		vim.api.nvim_set_var("doge_doc_standard_python", "google")
		vim.api.nvim_set_var("doge_enable_mappings", false)
		vim.keymap.set("n", "<Leader>D", "<Plug>(doge-generate)")
	end,
}
