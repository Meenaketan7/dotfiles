return {
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
      view = {
        width = 30,
        side = "left",
        relativenumber = true,
      },

      renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_diagnostics = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            diagnostics = true,
            modified = true,
          },
        },
        indent_markers = {
          enable = true,
        },
      },
      filters = { custom = { ".DS_Store", "node_modules" } },
      actions = {
        open_file = {
          window_picker = { enable = false },
        },
      },
      git = { enable = true, ignore = false, timeout = 500 },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 50,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      modified = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
    })
  end,
}
