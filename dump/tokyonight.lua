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

				-- Customize telescope color
				hl.TelescopePromptPrefix = {
					bg = colors.bg,
				}
				hl.TelescopePromptNormal = {
					bg = colors.bg,
				}
				hl.TelescopeResultsNormal = {
					bg = colors.bg,
				}
				hl.TelescopePreviewNormal = {
					bg = colors.bg,
				}
				hl.TelescopePromptBorder = {
					bg = colors.bg,
					fg = colors.bg,
				}
				hl.TelescopeResultsBorder = {
					bg = colors.bg,
					fg = colors.bg,
				}
				hl.TelescopePreviewBorder = {
					bg = colors.bg,
					fg = colors.bg,
				}
				hl.TelescopePromptTitle = {
					bg = colors.orange,
					fg = colors.bg,
				}
				hl.TelescopeResultsTitle = {
					fg = colors.bg,
				}
				hl.TelescopePreviewTitle = {
					bg = colors.blue,
					fg = colors.bg,
				}
			end,
		})

		vim.cmd("colorscheme tokyonight")
	end,
}
