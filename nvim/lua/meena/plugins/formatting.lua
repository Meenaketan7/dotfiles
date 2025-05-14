return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier", "prettier", stop_after_first = true },
                typescript = { "prettier", "prettier", stop_after_first = true },
                javascriptreact = { "prettier", "prettier", stop_after_first = true },
                typescriptreact = { "prettier", "prettier", stop_after_first = true },
                svelte = { "prettier" },
                css = { "prettier", "prettier" },
                html = { "prettier", "prettier" },
                json = { "prettier", "prettier" },
                yaml = { "prettier", "prettier" },
                markdown = { "prettier", "prettier" },
                graphql = { "prettier", "prettier" },
                liquid = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                bash = { "shfmt", "beautysh" },
                sh = { "shfmt" },
                -- Mobile / Native
                java = { "clang-format" },
                swift = { "clang-format" },
                objc = { "clang-format" },
                c = { "clang-format" },
                elixir = { "mix" },
            },
            formatters = {
                stylua = {
                    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
                },
                prettier = {
                    require_cwd = true,
                    cwd = require("conform.util").root_file({
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
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>mp", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "Format file or range (in visual mode)" })
    end,
}
