return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
      callback = function()
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldlevel = 99
      end,
    })

    treesitter.setup({
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      ensure_installed = {
        -- Frontend
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "scss",
        "svelte",
        "vue",
        "comment",
        "markdown_inline",
        "regex",
        -- Backend
        "json",
        "yaml",
        "graphql",
        "bash",
        "dockerfile",
        "prisma",
        "elixir",
        "heex",
        "eex",
        "zig",
        "surface",
        "erlang",

        -- React Native & Swift
        "java",
        "swift",
        "objc",

        -- Docs / Config
        "markdown",
        "markdown_inline",
        "gitignore",

        -- Essentials
        "lua",
        "vim",
        "vimdoc",
        "query",
        "c",
      },
      auto_install = true,
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "Z",
          node_incremental = "Z",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["[f"] = {
              query = "@function.outer",
              desc = "Select around function (outer)",
            },
            ["]f"] = {
              query = "@function.inner",
              desc = "Select inside function (inner)",
            },
            ["[c"] = {
              query = "@class.outer",
              desc = "Select around class (outer)",
            },
            ["]c"] = {
              query = "@class.inner",
              desc = "Select inside class (inner)",
            },
            ["[p"] = {
              query = "@parameter.outer",
              desc = "Select around parameter (outer)",
            },
            ["]p"] = {
              query = "@parameter.inner",
              desc = "Select inside parameter (inner)",
            },
          },
        },
      },
    })
  end,
}
