return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {}, -- Loads default behaviour
					["core.concealer"] = {}, -- Adds pretty icons to your documents
					["core.dirman"] = { -- Manages Neorg workspaces
						config = {
							workspaces = {
								notes = "~/Desktop/Private/notes/",
							},
						},
					},

					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.integrations.nvim-cmp"] = {},
				},
			})
		end,
	},
}
