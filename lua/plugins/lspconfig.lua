return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")

        -- List of LSP servers to install
        local servers = {
            "pyright",    -- Python LSP
            "clangd",     -- C++ LSP
            "ruff",       -- Python linter as an LSP (updated from ruff_lsp)
        }

        -- Setup Mason
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = servers, -- Ensure these LSPs are installed
        })

        -- Setup LSP servers automatically
        for _, server in ipairs(servers) do
            lspconfig[server].setup({})
        end

        -- Custom command to install all Mason tools manually
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            vim.cmd("MasonInstall " .. table.concat(servers, " "))
        end, {})
    end,
}

