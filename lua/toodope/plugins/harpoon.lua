return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- Keybindings

		vim.keymap.set("n", "<leader>pa", function()
			harpoon:list():add()
		end, { desc = "Harpoon add" })

		vim.keymap.set("n", "<leader>po", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon toggle quick menu" })

		-- Toggle previous & next buffers stored within Harpoon list

		vim.keymap.set("n", "<leader>pp", function()
			harpoon:list():prev()
		end, { desc = "Harpoon list previous" })

		vim.keymap.set("n", "<leader>pn", function()
			harpoon:list():next()
		end, { desc = "Harpoon list next" })
	end,
}
