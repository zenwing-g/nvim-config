-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set indentation width to 4 spaces
vim.opt.shiftwidth = 4

-- Display tab characters as 4 spaces
vim.opt.tabstop = 4

-- Make backspace treat tab as 4 spaces
vim.opt.softtabstop = 4

-- Show absolute line numbers
vim.opt.number = true

-- Show relative line numbers (useful for jumping)
vim.opt.relativenumber = true

-- Keep at least 6 lines visible above/below the cursor
vim.opt.scrolloff = 6

-- Highlight the current cursor line
vim.opt.cursorline = true

-- Override indentation settings for Lua files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua", -- Apply only to Lua files
	callback = function()
		-- Set indentation width to 2 spaces
		vim.bo.shiftwidth = 2
		-- Display tab characters as 2 spaces
		vim.bo.tabstop = 2
		-- Make backspace treat tab as 2 spaces
		vim.bo.softtabstop = 2
		-- Use spaces instead of tabs
		vim.bo.expandtab = true
	end,
})

-- Load Lazy.nvim plugin manager configuration
require("config.lazy")
