return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<leader>db", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle debug breakpoint" })

		vim.keymap.set("n", "<leader>dr", function()
			dap.continue()
		end, { desc = "Start or continue the debugger" })
	end,
}
