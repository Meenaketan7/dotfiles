return{
--dressing
    {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    },
--indent
    {
      "echasnovski/mini.indentscope",
      version = false,
      event = { "BufReadPre", "BufNewFile" },
      config = function()
        require("mini.indentscope").setup({
          symbol = "┊",
          draw = {
            delay = 0,
            animation = require("mini.indentscope").gen_animation.none(),
          },
          options = {
            border = "none",
            indent_at_cursor = true,
          },
        })
      end,
    },

-- bufferline
    {
      "akinsho/bufferline.nvim",
      dependencies = { "moll/vim-bbye", "nvim-tree/nvim-web-devicons" },
      version = "*",
      opts = { 
        options = {
          mode = "tabs",
          themable = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          color_icons = true,
          show_tab_indicators = true,
          sort_by = "insert_at_end",
        },
        highlights = {
          buffer_selected = {
            bold = true,
            italic = false,
          },
          fill = {
            bg = "none", -- removes background behind tabs
          },
          background = {
            bg = "none", -- removes background for non-selected tabs
          },
        },
      },
    }, 
--lualine
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")

        local function mode()
          local mode_map = {
            n = 'N', no = 'N', nov = 'N', niI = 'N', niR = 'N', niV = 'N',
            v = 'V', V = 'VL', [''] = 'VB',
            s = 'S', S = 'SL', [''] = 'SB',
            i = 'I', ic = 'IC', ix = 'IX',
            R = 'R', Rc = 'Rc', Rx = 'Rx', Rv = 'VR',
            c = 'C', cv = 'EX', ce = 'EX',
            r = '...', rm = 'M', ['r?'] = '?', ['!'] = 'SH', t = 'T',
          }
          return mode_map[vim.fn.mode()] or 'UNK'
        end

        local function getScrollPos()
          local icons = { "󰋙 ", "󰫃 ", "󰫄 ", "󰫅 ", "󰫆 ", "󰫇 ", "󰫈 " }
          local current = vim.api.nvim_win_get_cursor(0)[1]
          local lines = vim.api.nvim_buf_line_count(0)
          local i = math.floor((current - 1) / lines * #icons) + 1
          return string.format("c%%c %s", icons[i])
        end

        local wordCount = {}
        function wordCount.getWords()
          if vim.bo.filetype:match("md") or vim.bo.filetype == "txt" then
            local wc = vim.fn.wordcount()
            local n = wc.visual_words or wc.words
            return n == 1 and "1 word" or (n and (n .. " words") or "")
          else
            return ""
          end
        end

        local function show_macro_recording()
          local reg = vim.fn.reg_recording()
          return reg ~= "" and ("󰑋 " .. reg) or ""
        end

        lualine.setup({
          options = {
            theme = "auto",
            icons_enabled = true,
            component_separators = '',
            section_separators = { left = '', right = '' },
            disabled_filetypes = {},
          },
          sections = {
            lualine_a = {
              {
                mode,
                separator = { left = '' },
                right_padding = 2,
              },
            },
            lualine_b = {
              {
                "branch",
                icon = ' ',
                color = { fg = "#080808", bg = "#80a0ff" },
                padding = { left = 1, right = 1 },
              },
              { "diagnostics", sources = { "nvim_diagnostic" } },
              {
                "filename",
                file_status = true,
                path = 0,
                shorting_target = 40,
                symbols = {
                  modified = "󰐖 ",
                  readonly = " ",
                  unnamed = "[No Name]",
                  newfile = "[New]",
                },
              },
              {
                wordCount.getWords,
                cond = function() return wordCount.getWords() ~= "" end,
              },
              { "searchcount" },
              { "selectioncount" },
            },
            lualine_c = {
              function() return "%=" end,
            },
            lualine_x = {},
            lualine_y = {
              {
                function()
                  if lazy_status.has_updates() then
                    return lazy_status.updates()
                  else
                    return require("lualine.components.location")()
                  end
                end,
                color = function()
                  if lazy_status.has_updates() then
                    return { fg = "#ff9e64" }
                  else
                    return {}
                  end
                end,
              },
              { "encoding" },
              { "fileformat" },
              { "filetype" },
            },
            lualine_z = {
              {
                getScrollPos,
                width = 100,
                separator = { right = '' },
                left_padding = 2,
              },
            },
          },
          inactive_sections = {
            lualine_a = { "filename" },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { "location" },
          },
          extensions = { "quickfix", "oil", "fzf" },
        })

        vim.api.nvim_create_autocmd("RecordingEnter", {
          callback = function() lualine.refresh() end,
        })
        vim.api.nvim_create_autocmd("RecordingLeave", {
          callback = function()
            local timer = vim.loop.new_timer()
            timer:start(50, 0, vim.schedule_wrap(function()
              lualine.refresh()
            end))
          end,
        })
      end,
    },
    {
      "norcalli/nvim-colorizer.lua",
      event = "BufReadPre",
      config = function()
        require("colorizer").setup({
          "*", -- Enable for all filetypes
          css = { rgb_fn = true }, -- Support rgb() functions
          html = { names = true }, -- Enable color names like "red"
        })
      end,
    }
}
