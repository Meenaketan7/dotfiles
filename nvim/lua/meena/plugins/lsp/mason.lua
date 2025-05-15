return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "jsonls",
        "yamlls", -- YAML
        "bashls", -- Bash scripts
        "elixirls", -- Elixir LSP (ensure `elixir-ls` is properly installed)
        "marksman", -- Markdown
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "pyright",
      },
    })
    mason_tool_installer.setup({
      ensure_installed = {
        -- Web
        "prettierd",
        "prettier",

        -- Lua
        "stylua",

        -- Python
        "isort",
        "black",

        -- Shell
        "shfmt",

        -- Misc

        "markdownlint",
        "clang-format",
        --linter
        "pylint", -- python linter
        "eslint_d", -- js linter
      },
    })
  end,
}
