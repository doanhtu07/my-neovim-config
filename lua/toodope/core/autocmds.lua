vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightTextYank", {}),
	desc = "Hightlight selection on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("WrapLine", {}),
	desc = "Wrap line for certain file types",
	pattern = { "*.md" },
	callback = function()
		vim.cmd("setlocal wrap")
	end,
})
