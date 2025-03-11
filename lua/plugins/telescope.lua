--[[
Keybindings for telescope.nvim:

<leader>ff  -> Find files
<leader>fg  -> Live grep (search within files)
<leader>fb  -> Show open buffers
<leader>fh  -> Find help tags

Buffer navigation:
<Tab>       -> Switch to next buffer
<Shift-Tab> -> Switch to previous buffer
]]

return {
	{
		-- Plugin: telescope.nvim (Fuzzy finder for Neovim)
		"nvim-telescope/telescope.nvim",

		-- Use a stable tagged version
		tag = "0.1.8",

		-- Dependencies required for Telescope
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required for async operations
			"catppuccin/nvim", -- Theme integration
		},

		-- Plugin configuration
		config = function()
			require("telescope").setup({
				defaults = {
					prompt_prefix = "🔍 ", -- Custom search prompt icon
					selection_caret = " ", -- Arrow indicator for selection
					sorting_strategy = "ascending", -- Show results from top to bottom
					layout_config = {
						prompt_position = "top", -- Keep search prompt at the top
					},
					winblend = 10, -- Slight transparency effect
					border = true, -- Enable border around telescope window
					color_devicons = true, -- Show colored icons for file types
				},
				pickers = {
					find_files = {
						hidden = true, -- Include hidden files in search
					},
				},
			})

			-- Enable Telescope theme integration with Catppuccin
			require("catppuccin").setup({
				integrations = {
					telescope = true,
				},
			})

			-- Auto commands to adjust Telescope's appearance with the Catppuccin theme
			vim.cmd([[
        augroup TelescopeBackground
          autocmd!
          autocmd ColorScheme catppuccin highlight NormalFloat guibg=NONE
          autocmd ColorScheme catppuccin highlight TelescopeNormal guibg=NONE
          autocmd ColorScheme catppuccin highlight TelescopeBorder guifg=#1f1f1f
        augroup END
      ]])

			-- Telescope keybindings
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"<leader>fg",
				"<cmd>Telescope live_grep<cr>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>fh",
				"<cmd>Telescope help_tags<cr>",
				{ noremap = true, silent = true }
			)

			-- Buffer navigation keybindings
			vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })
		end,
	},
}
