return {
	"echasnovski/mini.diff",
	version = false,
	config = function()
		require("mini.diff").setup({
			view = {
				style = "sign",
				signs = { add = "+", change = "~", delete = "-" },
			},
		})
	end,
}
