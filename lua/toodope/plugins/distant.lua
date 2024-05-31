return {
	"chipsenkbeil/distant.nvim", -- This plugin is for connecting and modifying files in remote machine
	branch = "v0.3",
	config = function()
		require("distant"):setup()
	end,
}
