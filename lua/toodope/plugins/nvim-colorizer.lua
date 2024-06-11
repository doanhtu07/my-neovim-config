return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		local colorizer = require("colorizer")
		colorizer.setup({
			scss = {
				css = true,
			},
			css = {
				css = true,
			},
		})
	end,
}
