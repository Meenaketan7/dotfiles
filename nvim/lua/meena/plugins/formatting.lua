return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local util = require("conform.util")
    local oxfmt_configs = { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts", "oxfmt.config.mts" }
    local web_formatters = { "oxfmt", "prettier", stop_after_first = true }

    conform.setup({
      formatters_by_ft = {
        javascript = web_formatters,
        typescript = web_formatters,
        javascriptreact = web_formatters,
        typescriptreact = web_formatters,
        svelte = web_formatters,
        css = web_formatters,
        scss = web_formatters,
        html = web_formatters,
        json = web_formatters,
        jsonc = web_formatters,
        yaml = web_formatters,
        markdown = web_formatters,
        graphql = web_formatters,
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        bash = { "shfmt", "beautysh" },
        sh = { "shfmt" },
        -- Mobile / Native
        java = { "clang-format" },
        swift = { "swift", "swiftformat", stop_after_first = true },
        objc = { "clang-format" },
        c = { "clang-format" },
        -- Haskell
        haskell = { "fourmolu" },
        lhaskell = { "fourmolu" },
      },
      formatters = {
        stylua = {
          args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
        },
        oxfmt = {
          cwd = util.root_file(oxfmt_configs),
          require_cwd = true,
          condition = function(_, ctx)
            return vim.fs.root(ctx.filename, oxfmt_configs) ~= nil
          end,
        },
        prettier = {
          require_cwd = true,
          cwd = util.root_file({
            "package.json",
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.mjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
            "prettier.config.mjs",
          }),
        },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_format = "fallback",
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
