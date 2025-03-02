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
		local servers = {
			"pyright",
			"clangd",
			"ruff",
			"marksman",
		}
		local formatters = {
			"black",
			"clang-format",
			"prettier",
			"stylua", -- Added Stylua for Lua formatting
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
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.stylua, -- Added Stylua for Lua
			},
		})
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(servers, " "))
			vim.cmd("MasonInstall " .. table.concat(formatters, " "))
		end, {})
		vim.diagnostic.config({
			update_in_insert = false,
			virtual_text = false,
			signs = true,
			underline = true,
			severity_sort = true,
		})
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
