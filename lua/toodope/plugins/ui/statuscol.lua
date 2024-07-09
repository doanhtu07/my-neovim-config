-- https://github.com/kevinhwang91/nvim-ufo/issues/117
return {
	"luukvbaal/statuscol.nvim", -- to customize the status line on the left and hide some weird numbers there
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			-- foldfunc = "builtin",
			-- setopt = true,
			setopt = true,
			relculright = false, -- whether to right-align the relative line number
			segments = {
				-- https://github.com/luukvbaal/statuscol.nvim/blob/main/lua/statuscol.lua
				-- _G.ScFa = get_fold_action
				-- _G.ScSa = get_sign_action
				-- _G.ScLa = get_lnum_action
				{ text = { "%s" }, click = "v:lua.ScSa", auto = true },
				{
					sign = { name = { "diagnostic" }, maxwidth = 1, auto = true },
					click = "v:lua.ScSa",
				},
				{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
				{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
			},
		})
	end,
}
