return {
  {
    "wojciech-kulik/xcodebuild.nvim",
    cond = function()
      return vim.loop.os_uname().sysname == "Darwin"
    end,
    ft = { "swift", "objc", "objcpp" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      test_search = {
        lsp_client = "sourcekit",
      },
    },
    init = function()
      -- Toggle for Auto-Build on save
      vim.g.xcodebuild_auto_build = false
      vim.api.nvim_create_user_command("XcodebuildToggleAutoBuild", function()
        vim.g.xcodebuild_auto_build = not vim.g.xcodebuild_auto_build
        if vim.g.xcodebuild_auto_build then
          vim.notify("Xcodebuild Auto-Build ON", vim.log.levels.INFO, { title = "iOS" })
        else
          vim.notify("Xcodebuild Auto-Build OFF", vim.log.levels.INFO, { title = "iOS" })
        end
      end, {})

      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "*.swift", "*.m", "*.h", "*.mm", "*.cpp", "*.c" },
        callback = function()
          if vim.g.xcodebuild_auto_build then
            vim.cmd("XcodebuildBuild")
          end
        end,
      })
    end,
    keys = {
      { "<leader>X", "<cmd>XcodebuildPicker<CR>", desc = "Xcodebuild actions" },
      { "<leader>xf", "<cmd>XcodebuildProjectManager<CR>", desc = "Xcodebuild project manager" },

      { "<leader>ii", "<cmd>XcodebuildSetup<CR>", desc = "iOS: setup project" },
      { "<leader>ib", "<cmd>XcodebuildBuild<CR>", desc = "iOS: build" },
      { "<leader>iB", "<cmd>XcodebuildCleanBuild<CR>", desc = "iOS: clean build" },
      { "<leader>ir", "<cmd>XcodebuildBuildRun<CR>", desc = "iOS: build and run" },
      { "<leader>id", "<cmd>XcodebuildBuildDebug<CR>", desc = "iOS: build and debug" },
      { "<leader>it", "<cmd>XcodebuildTestNearest<CR>", desc = "iOS: test nearest" },
      { "<leader>iT", "<cmd>XcodebuildTest<CR>", desc = "iOS: test all" },
      { "<leader>ic", "<cmd>XcodebuildTestClass<CR>", desc = "iOS: test class" },
      { "<leader>is", "<cmd>XcodebuildSelectScheme<CR>", desc = "iOS: select scheme" },
      { "<leader>iv", "<cmd>XcodebuildSelectDevice<CR>", desc = "iOS: select device" },
      { "<leader>iN", "<cmd>XcodebuildNextDevice<CR>", desc = "iOS: next device" },
      { "<leader>iP", "<cmd>XcodebuildPreviousDevice<CR>", desc = "iOS: previous device" },
      { "<leader>il", "<cmd>XcodebuildToggleLogs<CR>", desc = "iOS: toggle logs" },
      { "<leader>iC", "<cmd>XcodebuildToggleCodeCoverage<CR>", desc = "iOS: toggle code coverage" },
      { "<leader>io", "<cmd>XcodebuildOpenInXcode<CR>", desc = "iOS: open in Xcode" },
      { "<leader>ia", "<cmd>XcodebuildToggleAutoBuild<CR>", desc = "iOS: toggle auto-build on save" },
    },
    config = function(_, opts)
      require("xcodebuild").setup(opts)
    end,
  },
}
