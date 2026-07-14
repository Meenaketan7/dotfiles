return {
  "mrcjkb/haskell-tools.nvim",
  version = "^4",
  lazy = false,
  ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = ok_cmp and cmp_nvim_lsp.default_capabilities() or vim.lsp.protocol.make_client_capabilities()

    vim.g.haskell_tools = {
      hls = {
        capabilities = capabilities,
        default_settings = {
          haskell = {
            formattingProvider = "fourmolu",
            checkProject = true,
            plugin = {
              stan = { globalOn = true },
              hlint = { globalOn = true },
            },
          },
        },
      },
      tools = {
        codeLens = { autoRefresh = true },
        hoogle = { mode = "auto" },
        hover = { enable = true, border = "rounded" },
      },
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "haskell", "lhaskell", "cabal", "cabalproject" },
      callback = function(ev)
        local ht = require("haskell-tools")
        local opts = { buffer = ev.buf, silent = true }

        vim.keymap.set("n", "<leader>hh", ht.hoogle.hoogle_signature, vim.tbl_extend("force", opts, { desc = "Hoogle: signature search" }))
        vim.keymap.set("n", "<leader>hr", ht.repl.toggle, vim.tbl_extend("force", opts, { desc = "Haskell: toggle repl" }))
        vim.keymap.set("n", "<leader>hf", function()
          ht.repl.toggle(vim.api.nvim_buf_get_name(0))
        end, vim.tbl_extend("force", opts, { desc = "Haskell: repl for file" }))
        vim.keymap.set("n", "<leader>hq", ht.repl.quit, vim.tbl_extend("force", opts, { desc = "Haskell: quit repl" }))
        vim.keymap.set("n", "<leader>hea", ht.lsp.buf_eval_all, vim.tbl_extend("force", opts, { desc = "Haskell: eval all code snippets" }))
        vim.keymap.set("n", "<leader>hs", ht.hoogle.hoogle_signature, vim.tbl_extend("force", opts, { desc = "Haskell: Hoogle search" }))
      end,
    })
  end,
}
