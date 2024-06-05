return {
	"nvim-telescope/telescope-media-files.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("media_files")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fm", telescope.extensions.media_files.media_files, { desc = "Fuzzy find media files" })
	end,
}
