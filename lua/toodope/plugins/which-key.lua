return {
  "folke/which-key.nvim", -- Easier for us to remember the keymap we config
  event = "VeryLazy", -- for Lazyvim to know that it's not very important for the UI and can load later

  -- Run during Neovim startup instead of when the plugin actually loads
  init = function()
    -- how long which-key will wait before activates
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,

  -- We could call which-key setup() but if define opts, it will do automatically
  opts = {
    -- your configuration comes here
    -- or leave it empty to use default
  },
}
