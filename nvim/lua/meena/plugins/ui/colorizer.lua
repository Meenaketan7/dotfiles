return {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      "*", -- Enable for all filetypes
      css = { rgb_fn = true }, -- Support rgb() functions
      html = { names = true }, -- Enable color names like "red"
    })
  end,
}
