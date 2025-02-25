return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          section_separators = {},  -- Keep section separators
          component_separators = {},  -- Keep component separators
        },
        sections = {
          lualine_a = { { "filename", path = 2, symbols = { modified = " ", readonly = " " } } },
          lualine_b = { "branch" },
          lualine_c = { },
          lualine_x = { "diagnostics" },
          lualine_y = { "filesize" },
          lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
        },
      })
    end,
  },
}
