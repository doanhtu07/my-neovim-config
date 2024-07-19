return {
	"petertriho/nvim-scrollbar",
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")

		require("scrollbar").setup({
			handle = {
				color = colors.overlay0,
			},
		})
	end,
}
