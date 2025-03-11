--[[
Keybindings for render-markdown.nvim:
(No default keybindings, but the plugin enhances Markdown rendering in Neovim.)
]]

return {
	{
		-- Plugin: render-markdown.nvim (Improved Markdown rendering for Neovim)
		"MeanderingProgrammer/render-markdown.nvim",

		-- Dependencies required for rendering
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- Uses Treesitter for parsing
			"nvim-tree/nvim-web-devicons", -- Adds file icons
		},

		-- Plugin options
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
