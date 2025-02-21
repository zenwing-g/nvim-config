return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    scope = { enabled = false },
    exclude = {
      filetypes = { "help", "markdown", "dashboard", "alpha", "startify", "NvimTree" },
      buftypes = { "terminal", "nofile" }
    }
  }
}

