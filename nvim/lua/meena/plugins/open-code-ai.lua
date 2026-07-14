return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  lazy = false, -- auto-start when Neovim launches
  dependencies = {
    { "folke/snacks.nvim", optional = true },
  },
  lsp = true,
}
