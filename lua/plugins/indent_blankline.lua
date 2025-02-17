return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" }, -- Customize indent character
    scope = { enabled = true }, -- Highlight the current scope
    exclude = { filetypes = { "help", "markdown" } } -- Exclude certain filetypes
  }
}

