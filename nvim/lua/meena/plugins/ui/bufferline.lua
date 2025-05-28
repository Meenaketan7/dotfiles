return {
  "akinsho/bufferline.nvim",
  dependencies = { "moll/vim-bbye", "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "buffers",
      themable = true,
      numbers = "none",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true,
      show_tab_indicators = true,
      sort_by = "insert_after_current",
      show_modified_icon = true,
      modified_icon = "*",
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          highlight = "Directory",
          text_align = "left",
        },
      },
      diagnostics_indicator = function(_, _, diagnostics)
        local icons = {
          Error = " ",
          Warn = " ",
          Info = " ",
          Hint = "󰌵 ",
        }

        local result = {}
        for severity, count in pairs(diagnostics) do
          local icon = icons[severity] or " "
          table.insert(result, icon .. count)
        end
        return table.concat(result, " ")
      end,
      custom_filter = function(buf_number, buf_numbers)
        -- Exclude certain filetypes from bufferline
        local exclude_ft = { "qf", "fugitive", "git" }
        local cur_ft = vim.bo[buf_number].filetype
        return not vim.tbl_contains(exclude_ft, cur_ft)
      end,
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
