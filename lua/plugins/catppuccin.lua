return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      vim.cmd.colorscheme("catppuccin")
      vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
      vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
      vim.cmd("highlight Pmenu guibg=NONE ctermbg=NONE")
      vim.cmd("highlight PmenuSel guibg=#3c383c ctermbg=NONE")
      vim.cmd("highlight Comment cterm=italic gui=italic")
      vim.cmd("highlight Keyword cterm=italic gui=italic")
      vim.cmd("highlight Function cterm=italic gui=italic")
      vim.cmd("highlight Identifier cterm=italic gui=italic")
    end,
  },
}
