return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- improve sorting performance of telescope
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local action_state = require("telescope.actions.state")

		-- https://github.com/nvim-telescope/telescope.nvim/issues/2657
		local layout_strategies = require("telescope.pickers.layout_strategies")
		layout_strategies.dynamic = function(self, max_columns, max_lines, layout_config)
			if vim.o.columns > 120 then
				return layout_strategies.horizontal(self, max_columns, max_lines, layout_config)
			else
				return layout_strategies.vertical(self, max_columns, max_lines, layout_config)
			end
		end

		telescope.setup({
			defaults = {
				-- https://yeripratama.com/blog/customizing-nvim-telescope/
				-- Customize looks - Theme
				layout_strategy = "dynamic",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						width = { padding = 0 },
						height = { padding = 0 },
						preview_width = 0.5,
					},
					vertical = {
						prompt_position = "top",
						width = { padding = 0 },
						height = { padding = 0 },
					},
				},
				sorting_strategy = "ascending",

				path_display = {
					-- shorten = {
					-- 	len = 1,
					-- 	exclude = { 1, 2, -3, -2, -1 },
					-- },
					filename_first = {
						reverse_directories = true,
					},
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						["<C-s>"] = actions.toggle_all,
					},
				},
				-- https://stackoverflow.com/questions/71809098/how-to-include-specific-hidden-file-folder-in-search-result-when-using-telescope
				-- Defines the command that will be used for `live_grep` and `grep_string` pickers.
				vimgrep_arguments = {
					"rg",
					"--follow", -- Follow symbolic links
					"--hidden", -- Search for hidden files
					"--no-heading", -- Don't group matches by each file
					"--with-filename", -- Print the file path with the matched lines
					"--line-number", -- Show line numbers
					"--column", -- Show column numbers
					"--smart-case", -- Smart case search

					-- Exclude some patterns from search
					"--glob=!**/.git/*",
					"--glob=!**/.idea/*",
					"--glob=!**/.vscode/*",
					"--glob=!**/build/*",
					"--glob=!**/dist/*",
					"--glob=!**/yarn.lock",
					"--glob=!**/package-lock.json",
				},
			},
			-- https://stackoverflow.com/questions/71809098/how-to-include-specific-hidden-file-folder-in-search-result-when-using-telescope
			pickers = {
				find_files = {
					hidden = true, -- Search for hidden files
					-- needed to exclude some files & dirs from general search
					-- when not included or specified in .gitignore
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob=!**/.git/*",
						"--glob=!**/.idea/*",
						"--glob=!**/.vscode/*",
						"--glob=!**/build/*",
						"--glob=!**/dist/*",
						"--glob=!**/yarn.lock",
						"--glob=!**/package-lock.json",
					},
				},
				oldfiles = {
					cwd_only = true,
				},
			},
			-- For plugin telescope media files to work
			-- https://github.com/nvim-telescope/telescope-media-files.nvim?tab=readme-ov-file
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "jpg", "mp4", "webm", "pdf", "svg" },
					-- find command (defaults to `fd`)
					-- find_cmd = "rg",
				},
				persisted = {
					-- layout_config = { width = 0.55, height = 0.55 },
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("persisted")

		-- https://medium.com/@jogarcia/delete-buffers-on-telescope-21cc4cf61b63
		local buffer_searcher
		buffer_searcher = function()
			builtin.buffers({
				sort_mru = true,
				-- ignore_current_buffer = true,
				-- show_all_buffers = false,
				attach_mappings = function(prompt_bufnr, map)
					local refresh_buffer_searcher = function()
						actions.close(prompt_bufnr)
						vim.schedule(buffer_searcher)
					end
					local delete_buf = function()
						-- https://github.com/nvim-telescope/telescope.nvim/issues/621
						local picker = action_state.get_current_picker(prompt_bufnr)
						picker:delete_selection(function(selection)
							vim.api.nvim_buf_delete(selection.bufnr, { force = true })
						end)
						refresh_buffer_searcher()
					end
					local delete_multiple_buf = function()
						local picker = action_state.get_current_picker(prompt_bufnr)
						local selection = picker:get_multi_selection()
						for _, entry in ipairs(selection) do
							vim.api.nvim_buf_delete(entry.bufnr, { force = true })
						end
						refresh_buffer_searcher()
					end
					map("n", "dd", delete_buf)
					map("n", "<C-d>", delete_multiple_buf)
					map("i", "<C-d>", delete_multiple_buf)
					return true
				end,
			})
		end

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fb", buffer_searcher, { desc = "Fuzzy find buffers" })
		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
	end,
}
