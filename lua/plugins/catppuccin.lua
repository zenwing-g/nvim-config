return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin") -- Set the colorscheme
      vim.cmd("highlight Normal guibg=NONE ctermbg=NONE") -- Make background transparent
    end,
  },
}

