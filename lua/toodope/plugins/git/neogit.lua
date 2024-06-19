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

		vim.keymap.set("n", "<leader>ng", function()
			neogit.open()
		end, { desc = "Open Neogit" })

		vim.keymap.set("n", "<leader>nd", function()
			require("diffview").open({})
		end, { desc = "Diff view git" })
	end,
}
