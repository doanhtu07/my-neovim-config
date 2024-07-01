return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				svg = { "prettier" }, -- https://github.com/prettier/prettier/issues/5322
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				java = { "google-java-format" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})

			-- To call fix all from eslint-lsp
			-- https://neovim.discourse.group/t/how-do-i-get-the-correct-filetype-based-on-a-file-extension/3163
			local filetype = vim.filetype.match({ buf = 0 })
			local pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact" }
			print(filetype)
			if filetype then
				for _, ext in ipairs(pattern) do
					if filetype == ext then
						vim.cmd("EslintFixAll")
						return
					end
				end
			end
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
