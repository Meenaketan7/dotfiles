return {
   --  {"github/copilot.vim"},
   -- Setup nvim-cmp
    {
       "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        version = false,
        dependencies = {
        "hrsh7th/cmp-buffer", -- source for text in buffer
        "hrsh7th/cmp-path", -- source for file system paths
            {
              "L3MON4D3/LuaSnip",
              -- follow latest release.
              version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
              -- install jsregexp (optional!).
              build = "make install_jsregexp",
            },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
        "hrsh7th/cmp-nvim-lsp"
        },
        config = function()

        end
    
    },
}
