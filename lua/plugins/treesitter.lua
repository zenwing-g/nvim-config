return {
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "python", "c", "cpp", "java", "lua", "go", "markdown", "markdown_inline" },
				sync_install = false,
				highlight = {
					enable = true,
					disable = {},
				},
				indent = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})

			-- C and C++ indentation settings
			vim.api.nvim_exec(
				[[
        augroup cpp_c_indent
          autocmd!
          autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
        augroup END
      ]],
				false
			)
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("render-markdown").setup({
				latex = { enabled = false },
				html = { enabled = false },
			})
		end,
	},
}
