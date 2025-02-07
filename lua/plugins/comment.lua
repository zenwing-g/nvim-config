return {
  {
    "numToStr/Comment.nvim",
    opts = {
      -- Keybindings for toggling comments
      toggler = {
        line = "gcc",  -- Toggle comment for the current line
        block = "gbc", -- Toggle block comment for the current line
      },
      -- Keybindings for commenting in operator-pending mode
      opleader = {
        line = "gc",  -- Comment a selected region in normal mode
        block = "gb", -- Block comment a selected region in normal mode
      },
      -- Extra keybindings for quick commenting
      extra = {
        above = "gcO", -- Add a comment line above
        below = "gco", -- Add a comment line below
        eol = "gcA",   -- Add a comment at the end of the current line
      }
    },
    lazy = false -- Load the plugin immediately
  }
}

