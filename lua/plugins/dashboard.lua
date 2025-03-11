--[[
Keybindings for dashboard-nvim:

f -> Open file search (Telescope find_files)
r -> Open recent files (Telescope oldfiles)
n -> Create a new file
q -> Quit Neovim
]]

return {
	{
		-- Plugin: dashboard-nvim (Custom startup dashboard for Neovim)
		"glepnir/dashboard-nvim",

		-- Load the dashboard when Neovim starts
		event = "VimEnter",

		-- Dependencies for icons
		dependencies = { "nvim-tree/nvim-web-devicons" },

		-- Plugin configuration
		config = function()
			require("dashboard").setup({
				theme = "hyper", -- Set dashboard theme

				config = {
					-- Custom header (ASCII art)
					header = {
						" ███╗   ██╗██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
						" ████╗  ██║██╔═══╝██╔═══██╗██║   ██║██║████╗ ████║ ",
						" ██╔██╗ ██║██████╗██║   ██║██║   ██║██║██╔████╔██║ ",
						" ██║╚██╗██║██╔═══╝██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
						" ██║ ╚████║██████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
						" ╚═╝  ╚═══╝╚═════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
					},

					-- Shortcut keys on the dashboard
					shortcut = {
						{
							desc = "󰍉  Find File",
							group = "DashboardShortCut",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = "󰍑  Recent Files",
							group = "DashboardShortCut",
							action = "Telescope oldfiles",
							key = "r",
						},
						{
							desc = "  New File",
							group = "DashboardShortCut",
							action = "ene | startinsert",
							key = "n",
						},
						{
							desc = "󰗼  Quit",
							group = "DashboardShortCut",
							action = "qa",
							key = "q",
						},
					},

					-- Custom footer message
					footer = {
						"",
						"I fear not the man who has 10,000 solutions to one problem",
						"but I fear the man who has 1 solution for 10,000 problems.",
						" ~ Brute Lee ~",
					},
				},
			})
		end,
	},
}
