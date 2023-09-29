-- pretty print
function pp(arg)
	print(vim.inspect(arg))
end

vim.filetype.add({
	extension = { ua = "uiua" },
})
