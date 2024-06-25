return {
	"olimorris/persisted.nvim",
	lazy = false, -- make sure the plugin is always loaded at startup
	config = function()
		local persisted = require("persisted")

		persisted.setup({
			should_autosave = function()
				-- do not autosave if the alpha dashboard is the current filetype
				if vim.bo.filetype == "alpha" then
					return false
				end
				return true
			end,
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionLoad<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
	end,
}
