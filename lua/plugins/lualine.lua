--[[
Keybindings:
(No keybindings required; lualine.nvim is a statusline plugin and works automatically.)
]]

return {
	{
		-- Plugin: lualine.nvim (Statusline for Neovim)
		"nvim-lualine/lualine.nvim",

		-- Plugin configuration
		config = function()
			require("lualine").setup({
				options = {
					section_separators = "", -- No section separators
					component_separators = "", -- No component separators
				},

				sections = {
					-- Left section: Show filename with path and status symbols
					lualine_a = {
						{
							"filename",
							path = 2, -- Show full path
							symbols = {
								modified = "[+]", -- Indicates modified file
								readonly = "[read only]", -- Indicates read-only file
								unnamed = "[No name]", -- Indicates unnamed file
							},
						},
					},

					-- Show Git branch in section B
					lualine_b = { "branch" },

					-- Keep section C empty
					lualine_c = {},

					-- Show diagnostics (errors, warnings, etc.) in section X
					lualine_x = { "diagnostics" },

					-- Show file size in section Y
					lualine_y = {},

					-- Show cursor location (line & column) in section Z
					lualine_z = { "location" },
				},
			})
		end,
	},
}
