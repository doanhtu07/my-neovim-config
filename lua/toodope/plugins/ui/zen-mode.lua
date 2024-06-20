return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup({})
		vim.keymap.set("n", "<leader>zm", "<Cmd>ZenMode<CR>", { desc = "Toggle Zen Mode" })
	end,
}
