return {
  "goolord/alpha-nvim",
  lazy = false,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local datetime = os.date("%A, %d %B %Y")
    -- HEADER ASCII ART
    dashboard.section.header.val = {
      [[        ⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀]],
      [[        ⠸⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣷]],
      [[        ⠸⣿⣻⡄⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡟]],
      [[⠀        ⢿⣧⢿⡄⠀⠀⠀⠀⠀⠀⣼⢣⣿⠇]],
      [[⠀        ⠈⢿⡌⣿⡀⠀⣠⠀⠀⣼⡏⣾⠏⠀]],
      [[⠀⠀⠀        ⠃⢻⣿⣦⣿⣧⣾⣿⠀⠁⠀⠀]],
      [[⠀⠀⠀         ⣾⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀]],
      [[⠀⠀⠀        ⢰⣿⡉⣿⣿⣿⡏⣿⣷⠀⠀⠀]],
      [[        ⠸⣆⠀⡻⣿⣿⣿⣶⣿⣿⣿⡿⠃⠀⠀]],
      [[    ⠀    ⡸⢿⣶⣍⡙⠿⠿⠿⢟⡹⢗⠀⠀⠀]],
      [[     ⠀⠀   ⢈⣿⣿⣿⣶⣶⢖⣩⣶⣿⣆⠀⠀]],
      [[          ⣼⠃⠻⢿⡟⣵⣿⣿⣿⠃⢻⡄⠀]],
      [[         ⠰⣟⣠⣋⡉⣈⣙⣉⣉⣉⣷⣸⡷⠀]],
      [[    ⠀     ⠻⢹⡿⣼⣿⣿⣿⣿⣿⣿⠹⠃⠀]],
      [[    ⠀⠀    ⠀⣿⡇⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀]],
      [[    ⠀⠀⠀    ⠀⣹⣿⠉⠉⠉⢹⣿⡁⠀⠀⠀]],
      [[     ⠀⠀    ⠛⠛⠛⠀⠀⠀⠘⠛⠛⠃⠀⠀]],
      "",
     "  Today is " .. datetime,
    }

    -- BUTTONS
    dashboard.section.buttons.val = {
      dashboard.button("e",     "  New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee","  Toggle File Explorer", "<cmd>NvimTreeToggle<CR>"),

      dashboard.button("SPC ff","󰱼  Find File", "<cmd>lua require('fzf-lua').files()<CR>"),
      dashboard.button("SPC fw","  Grep Word", "<cmd>lua require('fzf-lua').live_grep_native()<CR>"),

      dashboard.button("SPC wr","  Restore Session", "<cmd>SessionRestore<CR>"),
      dashboard.button("q",     "  Quit NVIM", "<cmd>qa<CR>"),
    }

    -- FOOTER
    local lazy_stats = require("lazy").stats()
    dashboard.section.footer.val = {
      "⚔️  Do not seek pleasure for its own sake. ― Miyamoto Musashi",
      "",
      "                       Plugins Loaded: " .. lazy_stats.loaded .. " / " .. lazy_stats.count,
    }

    -- FINAL SETUP
    alpha.setup(dashboard.opts)

    vim.cmd([[
      autocmd FileType alpha setlocal nofoldenable
    ]])
  end,
}

