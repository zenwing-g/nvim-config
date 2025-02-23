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
          lualine_a = { { "filename", path = 1, symbols = { modified = " ", readonly = " " } } },
          lualine_b = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
          lualine_c = { "branch" },
          lualine_x = { "diagnostics" },
          lualine_y = { "filesize" },
          lualine_z = { { "location", separator = { left = "", right = "" }, left_padding = 2 } },
        },
      })
    end,
  },
}

