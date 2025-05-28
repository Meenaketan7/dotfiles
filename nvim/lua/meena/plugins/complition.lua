return {
  --  {"github/copilot.vim"},

  -- Setup nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    version = false,
    dependencies = {
      -- Core sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",

      -- Snippets
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",

      -- UI / Icons
      "onsails/lspkind.nvim",
      "lukas-reineke/cmp-under-comparator",
      -- GitHub Copilot
      --"zbirenbaum/copilot.lua",
      --"zbirenbaum/copilot-cmp",
      -- Codeium AI completion
      {
        "Exafunction/codeium.nvim",
        event = "InsertEnter",
        build = ":Codeium Auth",
        config = function()
          require("codeium").setup({
            enable_cmp_source = true,
            virtual_text = {
              enabled = false, -- We're using cmp, not ghost text
            },
          })
        end,
      },
    },
    config = function()
      -- Copilot setup (disable UI panels, enable cmp integration only)
      --require("copilot").setup({
      --suggestion = { enabled = false },
      --panel = { enabled = false },
      --filetypes = {
      --markdown = true,
      --help = true,
      --},
      --})
      --require("copilot_cmp").setup()

      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        }),
        sources = cmp.config.sources({
          { name = "codeium", group_index = 1, priority = 100 },
          --{ name = "copilot" },
          { name = "nvim_lsp", group_index = 1 },
          { name = "luasnip", group_index = 1 },
          { name = "path", group_index = 2 },
          { name = "buffer", group_index = 2 },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = {
              Codeium = "",
              Copilot = "",
            },
            menu = {
              buffer = "[Buf]",
              nvim_lsp = "[LSP]",
              luasnip = "[Snip]",
              path = "[Path]",
              codeium = "[AI]",
              copilot = "[Copilot]",
            },
          }),
        },
        experimental = {
          ghost_text = false,
        },
      })

      -- Setup for `/` (search) and `:` (cmdline)
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
  },
  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      -- import nvim-autopairs
      local autopairs = require("nvim-autopairs")

      -- configure autopairs
      autopairs.setup({
        check_ts = true, -- enable treesitter
        ts_config = {
          lua = { "string" }, -- don't add pairs in lua string treesitter nodes
          javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
          java = false, -- don't check treesitter on java
        },
      })

      -- import nvim-autopairs completion functionality
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")

      -- import nvim-cmp plugin (completions plugin)
      local cmp = require("cmp")

      -- make autopairs and completion work together
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  --auto tag
  {
    "windwp/nvim-ts-autotag",

    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
}
