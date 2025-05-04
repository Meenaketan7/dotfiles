return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    indent = { char = "┊", tab_char = "│", },
  },
  scope = {
      show_start = false,
      show_end = false,
      show_exact_scope = false,
  }, 
}
