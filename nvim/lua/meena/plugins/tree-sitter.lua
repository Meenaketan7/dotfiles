return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
     },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")
         -- Set folding method to Tree-sitter for all buffers
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        callback = function()
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            -- Optional: start with all folds open
            vim.wo.foldlevel = 99
        end,
    })

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
        highlight = {
            enable = true,
        },
        -- enable indentation
        indent = { enable = true },
        -- enable autotagging (w/ nvim-ts-autotag plugin)
        autotag = {
            enable = true,
        },
        -- ensure these language parsers are installed
        ensure_installed = {
            -- Frontend
            "javascript", "typescript", "tsx", "html", "css", "scss", "svelte", "vue",

            -- Backend
            "json", "yaml", "graphql", "bash", "dockerfile", "prisma","elixir", "heex",

             -- React Native & Swift
            "java", "swift", "objc",

            -- Docs / Config
            "markdown", "markdown_inline", "gitignore",

            -- Essentials
            "lua", "vim", "vimdoc", "query", "c",
        },
        incremental_selection = {
        enable = true,
        keymaps = {
        init_selection = "zz", -- set to `false` to disable one of the mappings
        node_incremental = "zz",
        scope_incremental = false,
        node_decremental = "<bs>",
                },
            },   
        })
  end,
}
