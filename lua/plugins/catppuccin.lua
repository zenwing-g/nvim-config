--[[
Keybindings:
(No keybindings required; catppuccin is a theme plugin and applies automatically.)
]]
return {
	{
		-- Plugin: catppuccin (Neovim theme with pastel colors)
		"catppuccin/nvim",

		-- Alias for easier reference
		name = "catppuccin",

		-- Load the theme immediately
		lazy = false,

		-- Ensure it loads first before other plugins
		priority = 1000,

		-- Plugin configuration
		config = function()
			require("catppuccin").setup({
				transparent_background = true, -- Enables transparency

				styles = {
					comments = {},
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
					operators = {},
				},
			})

			-- Set colorscheme
			vim.cmd("colorscheme catppuccin")

			-- Ensure transparency for UI elements
			vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
			vim.cmd("highlight NormalNC guibg=NONE ctermbg=NONE")
			vim.cmd("highlight Pmenu guibg=NONE ctermbg=NONE")
			vim.cmd("highlight PmenuSel guibg=#3c383c ctermbg=NONE")
		end,
	},
}
