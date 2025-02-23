return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- Ensures it loads first
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- Available flavors: "latte" (light), "frappe" (darker), "macchiato" (dark), "mocha" (darkest)
        transparent_background = true, -- Ensures transparency
      })
      vim.cmd("colorscheme catppuccin")
      -- Ensure transparency
      vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
      vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
      vim.cmd("highlight Pmenu guibg=NONE ctermbg=NONE")
      vim.cmd("highlight PmenuSel guibg=#3c383c ctermbg=NONE")
      -- Italics for specific elements
      vim.cmd("highlight Comment cterm=italic gui=italic")
      vim.cmd("highlight Keyword cterm=italic gui=italic")
      vim.cmd("highlight Function cterm=italic gui=italic")
      vim.cmd("highlight Identifier cterm=italic gui=italic")
    end,
  },
}
