return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- Set the colorscheme
      vim.cmd.colorscheme("catppuccin")

      -- Make the background transparent
      vim.cmd("highlight Normal guibg=NONE ctermbg=NONE") -- Main editor area
      vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE") -- Non-current windows
      vim.cmd("highlight Pmenu guibg=NONE ctermbg=NONE") -- Popup menu
      vim.cmd("highlight PmenuSel guibg=#3c383c ctermbg=NONE") -- Selected item in popup menu

      -- Enable italics for various syntax elements
      vim.cmd("highlight Comment cterm=italic gui=italic")   -- Italicize comments
      vim.cmd("highlight Keyword cterm=italic gui=italic")   -- Italicize keywords
      vim.cmd("highlight Function cterm=italic gui=italic")  -- Italicize function names
      vim.cmd("highlight Identifier cterm=italic gui=italic") -- Italicize identifiers
    end,
  },
}

