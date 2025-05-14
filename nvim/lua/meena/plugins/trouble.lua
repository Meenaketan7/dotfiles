return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
    opts = {
        focus = true,
    },
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xs",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        {
            "<leader>xls",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / references / ... (Trouble)",
        },
        { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>",              desc = "Open trouble workspace diagnostics" },
        { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>",                 desc = "Open trouble quickfix list" },
        { "<leader>xl", "<cmd>Trouble loclist toggle<CR>",                  desc = "Open trouble location list" },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>",                     desc = "Open todos in trouble" },
    },
}
