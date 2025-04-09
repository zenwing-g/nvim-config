--[[
Keybindings for Treesitter text objects:

af -> Select entire function
if -> Select inside function
ac -> Select entire class
ic -> Select inside class

Usage examples:
- vaf  -> Visually select an entire function
- yif  -> Yank (copy) the inside of a function
- daf  -> Delete an entire function
- cic  -> Change inside class
]]

return {
	{
		-- Plugin: nvim-treesitter (Better syntax highlighting & parsing)
		"nvim-treesitter/nvim-treesitter",

		-- Run `:TSUpdate` after installation to keep parsers updated
		run = ":TSUpdate",

		-- Dependencies for extended features
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},

		-- Plugin configuration
		config = function()
			require("nvim-treesitter.configs").setup({
				-- Specify which languages to install
				ensure_installed = { "python", "c", "cpp", "java", "lua", "go", "markdown", "markdown_inline" },

				-- Install parsers asynchronously
				sync_install = false,

				-- Enable syntax highlighting
				highlight = {
					enable = true,
					disable = {}, -- No languages are disabled
				},

				-- Enable Treesitter-based indentation
				indent = {
					enable = true,
				},

				-- Enable text objects (for selecting code blocks)
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Jump to next occurrence of text object automatically
						keymaps = {
							["af"] = "@function.outer", -- Select entire function
							["if"] = "@function.inner", -- Select inside function
							["ac"] = "@class.outer", -- Select entire class
							["ic"] = "@class.inner", -- Select inside class
						},
					},
				},
			})

			-- Set C and C++ indentation to 2 spaces
			vim.api.nvim_exec(
				[[
        augroup cpp_c_indent
          autocmd!
          autocmd FileType c,cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4
        augroup END
        ]],
				false
			)
		end,
	},

	{
		-- Plugin: render-markdown.nvim (Renders Markdown files in a structured way)
		"MeanderingProgrammer/render-markdown.nvim",

		-- Dependencies required for rendering
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- Uses Treesitter for parsing
			"nvim-tree/nvim-web-devicons", -- Adds file icons
		},

		-- Plugin configuration
		config = function()
			require("render-markdown").setup({
				latex = { enabled = false }, -- Disable LaTeX rendering
				html = { enabled = false }, -- Disable HTML rendering
			})
		end,
	},
}
