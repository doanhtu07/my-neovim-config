return {
	"ray-x/lsp_signature.nvim", -- For signature help during typing
	event = "VeryLazy",
	opts = {},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,
}
