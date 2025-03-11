--[[
Keybinds:
This plugin works automatically and does not require explicit keybindings.
However, it integrates with <CR> (Enter key) for smart pairing inside brackets
]]

return {
	{
		-- Plugin: nvim-autopairs (automatically closes brackets, quotes, etc.)
		"windwp/nvim-autopairs",

		-- Load the plugin when entering insert mode
		event = "InsertEnter",

		config = function()
			require("nvim-autopairs").setup({
				-- Enable Treesitter integration for better pair detection
				check_ts = true,

				-- Disable autopairs in specific file types
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
}
