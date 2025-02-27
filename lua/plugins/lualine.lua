return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { { "filename", path = 2, symbols = { modified = "[+]", readonly = "[read only]", unnamed = "[No name]" } } },
          lualine_b = { "branch" },
          lualine_x = { "diagnostics" },
          lualine_y = { "filesize" },
          lualine_z = { "location" },
        },
      })
    end,
  },
}
