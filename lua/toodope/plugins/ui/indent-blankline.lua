return {
	"lukas-reineke/indent-blankline.nvim", -- This plugin is for guiding indentation
	event = { "BufReadPre", "BufNewFile" },
	main = "ibl", -- Tell lazy how to require the main module, ibl stands for the main file of this plugin
	opts = {
		-- Note: For the underline of scope, it depends on terminal font settings
		-- WezTerm has underline-thickness setting
		indent = { char = "╎" },
	},
}
