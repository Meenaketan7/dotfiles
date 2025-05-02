return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      local path = require("fzf-lua.path")

      local get_line_and_path = function(selected, opts)
        local file_and_path = path.entry_to_file(selected[1], opts).stripped
        vim.print(file_and_path)
        if vim.o.clipboard == "unnamed" then
          vim.fn.setreg("*", file_and_path)
        elseif vim.o.clipboard == "unnamedplus" then
          vim.fn.setreg("+", file_and_path)
        else
          vim.fn.setreg('"', file_and_path)
        end
        vim.fn.setreg("0", file_and_path) -- yank register
      end

      fzf.setup({
        "border-fused",
        fzf_opts = { ["--wrap"] = true },
        previewers = {
          builtin = { syntax_limit_b = 1024 * 100 },
        },
        winopts = {
          preview = {
            wrap = true,
          },
        },
        grep = {
          rg_glob = true,
          rg_glob_fn = function(query, opts)
            local regex, flags = query:match("^(.-)%s%-%-(.*)$")
            return (regex or query), flags
          end,
        },
        defaults = {
            formatter = "path.filename_first",
        },
        actions = {
          files = {
            true,
            ["ctrl-y"] = { fn = get_line_and_path, exec_silent = true },
          },
        },
      })

    
    local km = vim.keymap

    -- File and buffer navigation
    km.set("n", "<Leader>fff", fzf.files, { desc = "Find files in project" })
    km.set("n", "<Leader>fls", fzf.buffers, { desc = "List open buffers" })
    km.set("n", "<Leader>ffr", fzf.resume, { desc = "Resume last FZF search" })
    km.set("n", "<Leader>ffb", fzf.builtin, { desc = "FZF built-in commands" })

    -- Search
    km.set("n", "<Leader>ffg", fzf.live_grep_native, { desc = "Live grep in project" })
    km.set("n", "<Leader>f<Leader>f", fzf.lgrep_curbuf, { desc = "Live grep in current buffer" })
    km.set("n", "<Leader>ffw", fzf.grep_cword, { desc = "Search word under cursor" })
    km.set("v", "<Leader>ffv", fzf.grep_visual, { desc = "Search visual selection" })

    -- LSP and symbols
    km.set("n", "<Leader>fds", fzf.lsp_document_symbols, { desc = "Search document symbols" })

    -- Quickfix and marks
    km.set("n", "<Leader>fqf", fzf.quickfix, { desc = "Open quickfix list" })
    km.set("n", "<Leader>ffm", fzf.marks, { desc = "List marks" })

    -- Git
    km.set("n", "<Leader>fgs", fzf.git_status, { desc = "Show Git status" })
    km.set("n", "<Leader>fgb", fzf.git_branches, { desc = "Show Git branches" })
    end,
  },
}


