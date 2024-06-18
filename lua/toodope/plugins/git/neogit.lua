return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")

		neogit.setup({
			disable_line_numbers = false,
		})

		vim.keymap.set("n", "<leader>lg", function()
			neogit.open()
		end)
	end,
}
