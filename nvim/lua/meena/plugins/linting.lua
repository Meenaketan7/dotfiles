return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local oxlint_configs = { ".oxlintrc.json", ".oxlintrc.jsonc", "oxlint.config.ts", "oxlint.config.mts" }
    local eslint_filetypes = {
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
      svelte = true,
    }

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint" },
      swift = { "swiftlint" },
    }

    local function try_lint()
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname:match("%.swiftinterface$") then
        return
      end

      if eslint_filetypes[vim.bo.filetype] then
        if bufname ~= "" and vim.fs.root(bufname, oxlint_configs) then
          return -- Oxlint LSP handles this project.
        end

        local root = bufname ~= "" and vim.fs.root(bufname, { "package.json", ".eslintrc.js", ".git" })
        lint.try_lint(nil, { cwd = root or vim.fn.getcwd() })
        return
      end

      lint.try_lint()
    end

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = try_lint,
    })

    vim.keymap.set("n", "<leader>l", function()
      try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
