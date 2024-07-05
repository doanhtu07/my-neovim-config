return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons"
	config = function()
		-- https://www.youtube.com/watch?v=q1QhV-24DNA&list=PLOIdWGSU_Wcp9_w8euHJaux8DEIBCvYGc&index=10
		require("oil").setup({
			default_file_explorer = true,
			delete_to_trash = true,
			view_options = {
				show_hidden = true,
				natural_order = true,
			},
			win_options = {
				wrap = true,
			},
		})
		vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Open Oil at parent directory" })
	end,
}
