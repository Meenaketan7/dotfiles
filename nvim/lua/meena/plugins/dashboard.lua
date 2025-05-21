return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {

    dashboard = {
      enable = true,
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },

        -- 🐼 Pre-rendered panda (fast loading!)
        {
          pane = 2,
          section = "terminal",
          cmd = "ascii-image-converter ~/.config/nvim/lua/meena/assets/panda.png -C -c",
          height = 30,
          random = 10,
        },

        { section = "startup" },
      },
    },
  },
}

-- return {
--   "goolord/alpha-nvim",
--   lazy = false,
--   config = function()
--     local alpha = require("alpha")
--     local dashboard = require("alpha.themes.dashboard")
--     local datetime = os.date("%A, %d %B %Y")
--     -- HEADER ASCII ART
--     dashboard.section.header.val = {
--       [[        ⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀]],
--       [[        ⠸⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣷]],
--       [[        ⠸⣿⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡟]],
--       [[⠀        ⢿⣧⢿⡄⠀⠀⠀⠀⠀⠀⣼⢣⣿⠇]],
--       [[⠀        ⠈⢿⡌⣿⡀⠀⣠⠀⠀⣼⡏⣾⠏⠀]],
--       [[⠀⠀⠀        ⠃⢻⣿⣦⣿⣧⣾⣿⠀⠁⠀⠀]],
--       [[⠀⠀⠀         ⣾⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀]],
--       [[⠀⠀⠀        ⢰⣿⡉⣿⣿⣿⡏⣿⣷⠀⠀⠀]],
--       [[        ⠸⣆⠀⡻⣿⣿⣿⣶⣿⣿⣿⡿⠃⠀⠀]],
--       [[    ⠀    ⡸⢿⣶⣍⡙⠿⠿⠿⢟⡹⢗⠀⠀⠀]],
--       [[     ⠀⠀   ⢈⣿⣿⣿⣶⣶⢖⣩⣶⣿⣆⠀⠀]],
--       [[          ⣼⠃⠻⢿⡟⣵⣿⣿⣿⠃⢻⡄⠀]],
--       [[         ⠰⣟⣠⣋⡉⣈⣙⣉⣉⣉⣷⣸⡷⠀]],
--       [[    ⠀     ⠻⢹⡿⣼⣿⣿⣿⣿⣿⣿⠹⠃⠀]],
--       [[    ⠀⠀    ⠀⣿⡇⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀]],
--       [[    ⠀⠀⠀    ⠀⣹⣿⠉⠉⠉⢹⣿⡁⠀⠀⠀]],
--       [[     ⠀⠀    ⠛⠛⠛⠀⠀⠀⠘⠛⠛⠃⠀⠀]],
--       "",
--      "  Today is " .. datetime,
--     }
--
--     -- BUTTONS
--     dashboard.section.buttons.val = {
--       dashboard.button("e",     "  New File", "<cmd>ene<CR>"),
--       dashboard.button("SPC ee","  Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),
--
--       dashboard.button("SPC ff","󰱼  Find File", "<cmd>lua require('fzf-lua').files()<CR>"),
--       dashboard.button("SPC fw","  Grep Word", "<cmd>lua require('fzf-lua').live_grep_native()<CR>"),
--
--       dashboard.button("SPC wr","  Restore Session", "<cmd>SessionRestore<CR>"),
--       dashboard.button("q",     "  Quit NVIM", "<cmd>qa<CR>"),
--     }
--
--     -- FOOTER
--     local lazy_stats = require("lazy").stats()
--     dashboard.section.footer.val = {
--       "⚔️  Do not seek pleasure for its own sake. ― Miyamoto Musashi",
--       "",
--       "                       Plugins Loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
--     }
--
--     -- FINAL SETUP
--     alpha.setup(dashboard.opts)
--
--     vim.cmd([[
--       autocmd FileType alpha setlocal nofoldenable
--     ]])
--   end,
-- }
--
-- lazy.nvim
