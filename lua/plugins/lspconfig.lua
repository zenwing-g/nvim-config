return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- List of LSP servers to install
        local servers = {
            "pyright",  -- Python LSP
            "clangd",   -- C++ LSP
            "ruff",     -- Python linter as an LSP
        }

        -- Setup Mason
        mason.setup({
            ui = { border = "rounded" }, -- Rounded border for Mason UI
        })

        -- Ensure LSP servers are installed
        mason_lspconfig.setup({
            ensure_installed = servers,
        })

        -- Function to set up keybindings when an LSP attaches
        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to Definition
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Show Signature Help
        end

        -- Add nvim-cmp capabilities
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Configure LSP servers
        for _, server in ipairs(servers) do
            if server == "clangd" then
                lspconfig.clangd.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    root_dir = lspconfig.util.root_pattern(
                        ".git", "CMakeLists.txt", "Makefile", ".clangd", "compile_commands.json"
                    ),
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--compile-commands-dir=.",
                        "--header-insertion=never",
                        "--clang-tidy"
                    },
                })
            else
                lspconfig[server].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end
        end

        -- Command to install all Mason tools manually
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(servers, " "))
        end, {})
    end,
}

