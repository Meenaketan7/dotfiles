return{
  "nvim-tree/nvim-tree.lua",
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFindFileToggle",
    "NvimTreeCollapse",
    "NvimTreeRefresh",
  },
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Focus file in explorer" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse explorer" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh explorer" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { custom = { ".DS_Store" } },
      actions = {
        open_file = {
          window_picker = { enable = false },
        },
      },
      git = { ignore = false },
    })
  end,
}
