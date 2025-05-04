return {
  "akinsho/bufferline.nvim",
  dependencies = { "moll/vim-bbye", "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      themable = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      show_tab_indicators = true,
      sort_by = "insert_at_end",
    },
    highlights = {
      buffer_selected = {
        bold = true,
        italic = false,
      },
      fill = {
        bg = "none", -- removes background behind tabs
      },
      background = {
        bg = "none", -- removes background for non-selected tabs
      },
    },
  },
}
