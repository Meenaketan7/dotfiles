return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  enabled = true,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Choose: latte, frappe, macchiato, mocha
      transparent_background = false,
      show_end_of_buffer = true, -- shows '~' at the end
      term_colors = true,
      no_italic = false,
      no_bold = false,
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.2,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = { "bold" },
        operators = {},
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        telescope = {
          enabled = true,
          style = "nvchad", -- "nvchad", "classic"
        },
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = "lavender",
        },
        lsp_trouble = true,
        mason = true,
        lsp_saga = true,
        dashboard = true,
        which_key = true,
        illuminate = {
          enabled = true,
        },
        navic = {
          enabled = true,
          custom_bg = "NONE",
        },
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        indent_blankline = {
          enabled = true,
          scope_color = "lavender",
          colored_indent_levels = true,
        },
        bufferline = true,
        leap = true,
        markdown = true,
        flash = true,
        noice = true,
        semantic_tokens = true,
      },
      custom_highlights = function(colors)
        return {
          LineNr = { fg = colors.overlay1 },
          CursorLineNr = { fg = colors.lavender, style = { "bold" } },
          Visual = { bg = colors.surface1 },
          Search = { bg = colors.yellow, fg = colors.base },
          IncSearch = { bg = colors.peach, fg = colors.base },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
