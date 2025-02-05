return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- List of LSP servers to install
        local servers = {
            "pyright",    -- Python LSP
            "clangd",     -- C++ LSP
            "ruff",       -- Python linter as an LSP
        }

        -- Setup Mason
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = servers, -- Ensure these LSPs are installed
        })

        -- Keybindings for LSP features
        local on_attach = function(client, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Go to Definition
            vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts) -- Show Signature Help
        end

        -- Add nvim-cmp capabilities
        local capabilities = cmp_nvim_lsp.default_capabilities()

        -- Setup LSP servers automatically
        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- Custom command to install all Mason tools manually
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(servers, " "))
        end, {})
    end,
}

