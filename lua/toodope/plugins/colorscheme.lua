return {
  "folke/tokyonight.nvim",
  priority = 1000, -- Make this loads before any other plugins
  config = function()
    vim.cmd("colorscheme tokyonight")
  end
}
