return {
	"stevearc/aerial.nvim", -- Plugin to see the symbols in a file
	config = function()
		require("aerial").setup({
			backends = { "lsp", "treesitter", "markdown", "asciidoc", "man" },

			layout = {
				min_width = 40,
			},

			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				vim.keymap.set("n", "[a", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "]a", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,

			filter_kind = false,
		})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
	end,
}
