vim.opt.expandtab = true
vim.opt.shiftwidth = 4  -- Indent with 4 spaces
vim.opt.tabstop = 4      -- Tabs appear as 4 spaces
vim.opt.softtabstop = 4  -- Backspace treats tab as 4 spaces
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 5
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.o.mouse = ""

require("config.lazy")

