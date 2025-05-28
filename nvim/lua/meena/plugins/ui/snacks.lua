return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    indent = {
      enable = true,
      char = "┊",
      only_scope = true,
      only_current = true,
    },
    animate = { enable = false },
    scope = {
      enabled = true,
      only_current = true,
      only_scope = true,
      underline = false,
    },
    chunk = {
      enable = true,
      only_current = true,
    },
    notifier = {
      enable = true,
      padding = true,
      timeout = 3000,
      level = vim.log.levels.TRACE,
      icons = {
        error = " ",
        warn = " ",
        info = " ",
        debug = " ",
        trace = " ",
      },
    },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
  },
  keys = {
    {
      "<S-n>",
      function()
        require("snacks").notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<S-t>",
      function()
        require("snacks").terminal()
      end,
      desc = "Toggle Terminal",
    },
  },
}
