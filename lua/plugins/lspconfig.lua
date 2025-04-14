--[[
Keybindings for LSP:

gd        -> Go to definition
<C-k>     -> Show function signature help (Insert mode)
<leader>fm -> Manually format the current file

LSP behavior:
- Virtual text for diagnostics is **disabled** in insert mode.
- Virtual text is **enabled** when switching to normal mode.
- Auto-formatting occurs **on save**.
]]

return {
	{
		-- Plugin: nvim-lspconfig (LSP support for Neovim)
		"neovim/nvim-lspconfig",

		-- Dependencies for managing LSPs and formatters
		dependencies = {
			"williamboman/mason.nvim", -- Package manager for LSPs, formatters, linters
			"williamboman/mason-lspconfig.nvim", -- Mason integration for LSPConfig
			"nvimtools/none-ls.nvim", -- Replacing null-ls (for formatters & linters)
			"jay-babu/mason-null-ls.nvim", -- Mason integration for none-ls
		},

		-- Plugin configuration
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local mason_null_ls = require("mason-null-ls")
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local null_ls = require("null-ls")

			-- Language servers to install
			local servers = {
				"pyright",
				"clangd",
				"ruff",
				"marksman",
				"gopls", -- Go language server
				"arduino_language_server", -- Arduino Language Server
			}

			-- Formatters to install
			local formatters = {
				"black",
				"clang-format",
				"prettier",
				"stylua",
				"gofumpt", -- Go formatter
				"golines", -- Go line-wrapping formatter
			}

			-- Mason setup
			mason.setup({
				ui = { border = "rounded" },
			})

			-- Ensure LSPs are installed
			mason_lspconfig.setup({
				ensure_installed = servers,
			})

			-- Ensure formatters are installed
			mason_null_ls.setup({
				ensure_installed = formatters,
				automatic_installation = true,
			})

			-- Function to attach LSP features when a server starts
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to Definition
				vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Show Signature Help
			end

			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Configure each LSP
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			-- Custom Arduino LSP config
			lspconfig.arduino_language_server.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				cmd = { "arduino-language-server" },
				filetypes = { "arduino" },
				settings = {
					arduino = {
						cli = { path = "arduino-cli" },
						board_manager = { enabled = true },
						sketch = { path = "./" },
					},
				},
			})

			-- Setup formatters using null-ls
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.golines,
				},
			})

			-- Command to install all necessary tools
			vim.api.nvim_create_user_command("MasonInstallAll", function()
				vim.cmd("MasonInstall " .. table.concat(servers, " "))
				vim.cmd("MasonInstall " .. table.concat(formatters, " "))
			end, {})

			-- Diagnostic configuration
			vim.diagnostic.config({
				update_in_insert = false,
				virtual_text = false,
				signs = true,
				underline = true,
				severity_sort = true,
			})

			-- Toggle virtual text when changing modes
			vim.api.nvim_create_autocmd("ModeChanged", {
				pattern = "*:n", -- Entering normal mode
				callback = function()
					vim.diagnostic.config({ virtual_text = true })
				end,
			})

			vim.api.nvim_create_autocmd("ModeChanged", {
				pattern = "n:*", -- Leaving normal mode
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
	},
}
