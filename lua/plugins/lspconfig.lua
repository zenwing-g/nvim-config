return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvimtools/none-ls.nvim", -- Replacing null-ls
		"jay-babu/mason-null-ls.nvim", -- Mason integration for none-ls
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_null_ls = require("mason-null-ls")
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local null_ls = require("null-ls") -- Correct module name

		-- Language servers
		local servers = {
			"pyright",
			"clangd",
			"ruff",
			"marksman",
			"gopls", -- Added Go language server
		}

		-- Formatters
		local formatters = {
			"black",
			"clang-format",
			"prettier",
			"stylua",
			"gofumpt", -- Go formatter
			"golines", -- Go line-wrapping formatter
		}

		mason.setup({
			ui = { border = "rounded" },
		})

		mason_lspconfig.setup({
			ensure_installed = servers,
		})

		mason_null_ls.setup({
			ensure_installed = formatters,
			automatic_installation = true,
		})

		local on_attach = function(client, bufnr)
			local bufopts = { noremap = true, silent = true, buffer = bufnr }
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to Definition
			vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Show Signature Help
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		-- Custom Go LSP config
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				gopls = {
					usePlaceholders = true, -- Enables function argument placeholders
					completeUnimported = true, -- Auto-import missing packages
					staticcheck = true, -- Enables static analysis
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		-- null-ls setup for formatters
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.gofumpt, -- Go formatter
				null_ls.builtins.formatting.golines, -- Go line-wrapping formatter
			},
		})

		-- Command to install all necessary tools
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(servers, " "))
			vim.cmd("MasonInstall " .. table.concat(formatters, " "))
		end, {})

		-- Diagnostic config
		vim.diagnostic.config({
			update_in_insert = false,
			virtual_text = false,
			signs = true,
			underline = true,
			severity_sort = true,
		})

		-- Toggle virtual text on mode change
		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "*:n", -- When entering normal mode
			callback = function()
				vim.diagnostic.config({ virtual_text = true })
			end,
		})

		vim.api.nvim_create_autocmd("ModeChanged", {
			pattern = "n:*", -- When leaving normal mode
			callback = function()
				vim.diagnostic.config({ virtual_text = false })
			end,
		})

		-- Autoformat on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})

		-- Keybind for manual formatting
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = false })
		end, { noremap = true, silent = true })
	end,
}
