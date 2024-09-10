return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jayp0521/mason-nvim-dap.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_nvim_dap = require("mason-nvim-dap")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				-- "svelte",
				-- "emmet_ls",
				-- "prismals",
				--
				-- "ts_ls",
				-- "eslint",
				-- "html",
				-- "cssls", -- for css, scss, less
				-- "tailwindcss",
				-- "graphql",
				--
				-- "lua_ls",
				-- "marksman", -- for markdown language server (with local doc link...)
				-- "jdtls", -- for java language server
				-- "jedi_language_server", -- for python language server
				-- "clangd", -- for c, c++ language server
				--
				-- "docker_compose_language_service", -- for docker-compose
				-- "dockerls", -- for dockerfile
				--
				-- "cmake", -- for cmake
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- "prettier", -- prettier formatter
				-- "stylua", -- lua formatter
				-- "isort", -- python formatter
				-- "black", -- python formatter
				-- -- "pylint", -- python linter, install in environment we want instead: https://github.com/williamboman/mason.nvim/issues/1336
				-- "google-java-format", -- java formatter
				-- "cmakelang", -- cmake formatter and linter
			},
		})

		-- https://www.youtube.com/watch?v=lsFoZIg-oDs
		mason_nvim_dap.setup({
			automatic_installation = false,
			handlers = {},
			ensure_installed = {
				-- "javatest", -- java-test (Java test runner)
				-- "javadbg", -- java-debug-adapter (Java debugger)
				-- "codelldb", -- C/C++ debugger
			},
		})
	end,
}
