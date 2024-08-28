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
		vim.g.codeium_disable_bindings = 1

		vim.keymap.set("i", "<M-Bslash>", function()
			return vim.fn["codeium#Complete"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-f>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-tab>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-]>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })

		vim.keymap.set("i", "<M-[>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
	end,
}
