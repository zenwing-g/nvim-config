-- Show absolute line numbers
vim.opt.number = true

-- Show relative line numbers (useful for jumping)
vim.opt.relativenumber = true

-- Keep at least 6 lines visible above/below the cursor
vim.opt.scrolloff = 6

-- Highlight the current cursor line
vim.opt.cursorline = true

-- Load Lazy.nvim plugin manager configuration
require("config.lazy")
