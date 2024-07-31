return {
	"nvim-telescope/telescope-frecency.nvim",
	config = function()
		local telescope = require("telescope")

		telescope.setup({
			extensions = {
				frecency = {
					show_scores = true,
					show_filter_column = false,
				},
			},
		})

		telescope.load_extension("frecency")
	end,
}
