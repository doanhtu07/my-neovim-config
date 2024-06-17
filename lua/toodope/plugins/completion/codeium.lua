return {
	"Exafunction/codeium.vim",
	version = "1.8.37", -- https://github.com/Exafunction/codeium.vim/issues/376
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	event = "BufEnter",
	enabled = true,
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set("i", "<M-g>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-x>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
