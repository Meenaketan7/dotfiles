return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    --import lsp plugin
    local lspconfig = require("lspconfig")
    -- import mason_lspconfig plugin
    local mason_lspconfig = require("mason-lspconfig")
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    -- Reserve a space in the gutter
    -- This will avoid an annoying layout shift in the screen
    vim.opt.signcolumn = "yes"
    -- This is where you enable features that only work on servers that are
    -- if there is a language server active in the file
    local keymap = vim.keymap -- for concisenessvime

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- LSP hover and help
        keymap.set("n", "cK", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
        keymap.set("n", "cs", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))

        -- LSP navigation (FzfLua)
        keymap.set(
          "n",
          "fcd",
          "<cmd>FzfLua lsp_definitions<CR>",
          vim.tbl_extend("force", opts, { desc = "Go to definition (FzfLua)" })
        )

        keymap.set("n", "cd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
        keymap.set(
          "n",
          "fci",
          "<cmd>FzfLua lsp_implementations<CR>",
          vim.tbl_extend("force", opts, { desc = "Go to implementation (FzfLua)" })
        )
        keymap.set(
          "n",
          "fco",
          "<cmd>FzfLua lsp_type_definitions<CR>",
          vim.tbl_extend("force", opts, { desc = "Go to type definition (FzfLua)" })
        )
        keymap.set(
          "n",
          "fcr",
          "<cmd>FzfLua lsp_references<CR>",
          vim.tbl_extend("force", opts, { desc = "Show references (FzfLua)" })
        )

        -- Diagnostics
        keymap.set(
          "n",
          "<leader>fcd",
          ":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>",
          vim.tbl_extend("force", opts, { desc = "Document diagnostics (FzfLua)" })
        )
        keymap.set("n", "<leader>cd", function()
          vim.diagnostic.open_float(0, { scope = "line" })
        end, vim.tbl_extend("force", opts, { desc = "Line diagnostics (float)" }))
        keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))
        keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

        -- Code actions and rename
        keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
        keymap.set(
          "n",
          "<leader>fca",
          ":lua require'fzf-lua'.lsp_code_actions({ winopts = {relative='cursor',row=1.01, col=0, height=0.2, width=0.4} })<cr>",
          { desc = "FzfLua Code Actions" }
        )
        keymap.set("n", "<leader>crn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
        keymap.set({ "n", "x" }, "<leader>fr", function()
          vim.lsp.buf.format({ async = true })
        end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))

        -- Restart LSP
        keymap.set("n", "<leader>crs", "<cmd>LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })
    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    mason_lspconfig.setup({
      handlers = {
        -- default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["svelte"] = function()
          -- configure svelte server
          lspconfig["svelte"].setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              vim.api.nvim_create_autocmd("BufWritePost", {
                pattern = { "*.js", "*.ts" },
                callback = function(ctx)
                  -- Here use ctx.match instead of ctx.file
                  client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
                end,
              })
            end,
          })
        end,
        ["graphql"] = function()
          -- configure graphql language server
          lspconfig["graphql"].setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,
        ["emmet_ls"] = function()
          -- configure emmet language server
          lspconfig["emmet_ls"].setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
        ["elixirls"] = function()
          require("lspconfig").elixirls.setup({
            cmd = { "elixir-ls" }, -- ensure elixir-ls is available
            capabilities = capabilities,
            settings = {
              elixirLS = {
                dialyzerEnabled = false,
                fetchDeps = false,
              },
            },
          })
        end,
      },
      -- make sure to setup null-ls sources for mason
    })
  end,
}
