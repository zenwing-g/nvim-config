--[[
Keybindings for Comment.nvim:

gcc   -> Toggle comment for the current line
gbc   -> Toggle block comment

gc<motion> -> Comment based on motion (e.g., `gcj` to comment current and next line)
gb<motion> -> Block comment based on motion

gcO   -> Add comment above current line
gco   -> Add comment below current line
gcA   -> Add comment at the end of the line
]]

return {
	{
		-- Plugin: Comment.nvim (Easily toggle comments in Neovim)
		"numToStr/Comment.nvim",

		-- Plugin options
		opts = {
			toggler = {
				line = "gcc", -- Toggle comment for the current line
				block = "gbc", -- Toggle block comment
			},
			opleader = {
				line = "gc", -- Comment operator for line-wise commenting (gc + motion)
				block = "gb", -- Comment operator for block-wise commenting (gb + motion)
			},
			extra = {
				above = "gcO", -- Add comment above current line
				below = "gco", -- Add comment below current line
				eol = "gcA", -- Add comment at the end of the current line
			},
		},

		-- Load the plugin immediately
		lazy = false,
	},
}
