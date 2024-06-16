vim.g.mapleader = " "

local keymap = vim.keymap

-- mode, new keymap, original action
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- <CR> = Enter to execute the command
-- https://stackoverflow.com/questions/22142755/what-is-the-meaning-of-a-cr-at-the-end-of-some-vim-mappings
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>=", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
keymap.set("n", "<leader>s=", "<C-w>5+", { desc = "Increase window height" })
keymap.set("n", "<leader>s-", "<C-w>5-", { desc = "Decrease window height" })
keymap.set("n", "<leader>s>", "<C-w>10>", { desc = "Increase window width" })
keymap.set("n", "<leader>s<", "<C-w>10<", { desc = "Decrease window width" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Neorg
-- https://github.com/nvim-neorg/neorg/discussions/1066
vim.opt.conceallevel = 3
vim.keymap.set("n", "<leader>nt", function()
	vim.schedule(function()
		if vim.opt.conceallevel:get() == 3 then
			vim.opt.conceallevel = 0
		elseif vim.opt.conceallevel:get() == 0 then
			vim.opt.conceallevel = 3
		end
	end)
	vim.cmd.Neorg("toggle-concealer")
end, { desc = "Toggle Neorg concealer" })
