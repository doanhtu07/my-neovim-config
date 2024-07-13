-- https://www.youtube.com/watch?v=P7NYyb65A4s&t=698s
local config = {
	-- https://github.com/mfussenegger/nvim-jdtls/discussions/567
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") }, -- See `:h base-directories`
	root_dir = vim.fs.dirname(vim.fs.find({
		".git",
		"toodopejava", -- For faster search. Since jdtls will search upward, so for standalone java files, jdtls ends up search the whole home directory...
		"mvnw",
		"gradlew",
	}, { upward = true })[1]),
}
require("jdtls").start_or_attach(config)
