return {
	"tadmccorkle/markdown.nvim",
	ft = "markdown", -- or 'event = "VeryLazy"'
	config = function()
		require("markdown").setup({
			mappings = {
				inline_surround_toggle = false, -- (string|boolean) toggle inline style
				inline_surround_toggle_line = false, -- (string|boolean) line-wise toggle inline style
				inline_surround_delete = false, -- (string|boolean) delete emphasis surrounding cursor
				inline_surround_change = false, -- (string|boolean) change emphasis surrounding cursor
				link_add = "gl", -- (string|boolean) add link
				link_follow = "gx", -- (string|boolean) follow link
				go_curr_heading = "]c", -- (string|boolean) set cursor to current section heading
				go_parent_heading = "]p", -- (string|boolean) set cursor to parent section heading
				go_next_heading = "]]", -- (string|boolean) set cursor to next section heading
				go_prev_heading = "[[", -- (string|boolean) set cursor to previous section heading
			},
		})

		vim.keymap.set("n", "<leader>mi", "<cmd>MDInsertToc<cr>", { desc = "Insert table of contents (markdown)" })
		vim.keymap.set("n", "<leader>mo", "<cmd>MDToc<cr>", { desc = "Open table of contents (markdown)" })
	end,
}
