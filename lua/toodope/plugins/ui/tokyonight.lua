return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Make this loads before any other plugins
	config = function()
		local tokyonight = require("tokyonight")

		-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua
		tokyonight.setup({
			style = "night",
			on_highlights = function(hl, colors)
				hl.LineNrAbove = {
					fg = colors.blue,
				}
				hl.LineNrBelow = {
					fg = colors.cyan,
				}
				hl.CursorLineNr = {
					fg = colors.orange,
					bold = true,
				}
			end,
		})

		vim.cmd("colorscheme tokyonight")
	end,
}
