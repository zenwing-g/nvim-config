--[[
Keybindings for nvim-cmp:

<C-Space> -> Trigger completion menu
<CR>      -> Confirm completion selection
<Tab>     -> Select next completion item
<S-Tab>   -> Select previous completion item
]]

return {
	{
		-- Plugin: nvim-cmp (Autocompletion framework for Neovim)
		"hrsh7th/nvim-cmp",

		-- Dependencies for additional completion sources and functionality
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP-based completion
			"hrsh7th/cmp-buffer", -- Buffer word completion
			"hrsh7th/cmp-path", -- Path completion
			"hrsh7th/cmp-cmdline", -- Command-line completion
			"saadparwaiz1/cmp_luasnip", -- Snippet support
			"L3MON4D3/LuaSnip", -- Snippet engine
			"rafamadriz/friendly-snippets", -- Predefined snippets
			"onsails/lspkind.nvim", -- Adds icons to completion items
			"windwp/nvim-autopairs", -- Auto-closing pairs
		},

		-- Plugin configuration
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load VS Code-style snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- nvim-cmp setup
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Expand snippet using LuaSnip
					end,
				},

				-- Key mappings for completion navigation
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
					["<Tab>"] = cmp.mapping.select_next_item(), -- Select next completion item
					["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Select previous completion item
				}),

				-- Completion sources
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP-based suggestions
					{ name = "luasnip" }, -- Snippet suggestions
					{ name = "buffer" }, -- Buffer word suggestions
					{ name = "path" }, -- Path suggestions
				}),

				-- Formatting for completion menu
				formatting = {
					format = require("lspkind").cmp_format({ with_text = true }), -- Enable icons
				},

				-- Enable bordered completion and documentation windows
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			})

			-- Auto-pair setup (for automatically closing brackets, quotes, etc.)
			require("nvim-autopairs").setup({})
		end,
	},
}
