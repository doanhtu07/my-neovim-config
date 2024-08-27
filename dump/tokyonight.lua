return {
	"folke/tokyonight.nvim",
	priority = 1000, -- Make this loads before any other plugins
	config = function()
		local tokyonight = require("tokyonight")

		-- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_night.lua
		tokyonight.setup({
			style = "moon",
			on_highlights = function(hl, colors)
				-- Customize line number color
				hl.LineNrAbove = {
					fg = colors.dark5,
				}
				hl.LineNrBelow = {
					fg = colors.dark5,
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
				-- hl.TelescopePromptBorder = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- }
				-- hl.TelescopeResultsBorder = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- }
				-- hl.TelescopePreviewBorder = {
				-- 	bg = colors.bg,
				-- 	fg = colors.bg,
				-- }
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

				-- Gitsigns
				hl.GitSignsAdd = { fg = colors.green2 } -- diff mode: Added line |diff.txt|
				hl.GitSignsChange = { fg = colors.orange } -- diff mode: Changed line |diff.txt|
				hl.GitSignsDelete = { fg = colors.red } -- diff mode: Deleted line |diff.txt|
			end,
		})

		vim.cmd("colorscheme tokyonight")
	end,
}
