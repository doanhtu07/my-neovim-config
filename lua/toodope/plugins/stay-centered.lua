return {
	"arnamak/stay-centered.nvim",
	config = function()
		require("stay-centered").setup({
			enabled = true,
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>st",
			require("stay-centered").toggle,
			{ desc = "Toggle stay-centered.nvim" }
		)
	end,
}
