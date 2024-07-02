return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			dim_inactive = {
				enabled = true, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			highlight_overrides = {
				all = function(colors)
					return {
						LineNr = { fg = colors.blue },
						CursorLineNr = { fg = colors.pink, bold = true },
					}
				end,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
