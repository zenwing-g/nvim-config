return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = { left = "", right = "" },  -- Curved separators for sections
          component_separators = { left = "", right = "" },  -- Component dividers
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
          lualine_b = { "branch" },
          lualine_c = { { "filename", path = 1, symbols = { modified = " ", readonly = " " } } },
          lualine_x = { "filetype" },
          lualine_y = { " " },
          lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
        },
      })
    end,
  },
}


