vim.opt.expandtab = true
vim.opt.shiftwidth = 4-- Indent with 4 spaces
vim.opt.tabstop = 4-- Tabs appear as 4 spaces
vim.opt.softtabstop = 4-- Backspace treats tab as 4 spaces
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.scrolloff = 6
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true
  end,
})


require("config.lazy")

