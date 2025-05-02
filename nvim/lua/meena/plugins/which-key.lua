return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section belowi
       preset = "modern",
       delay=0,
       icons = {
            rules = false,
            breadcrumb = " ", -- symbol used in the command line area that shows your active key combo
            separator = "󱦰  ", -- symbol used between a key and it's label
            group = "󰹍 ", -- symbol prepended to a group
        },
       plugins = {
            spelling = {
                enabled = false,
            },
        },
        win = {
            height = {
                max = math.huge,
           },
        },
     },
}
