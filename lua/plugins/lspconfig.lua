return {
    "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "pyright", "clangd" }  -- Ensure LSPs are installed
        })

        local lspconfig = require("lspconfig")

        -- Python LSP (Pyright)
        lspconfig.pyright.setup({})

        -- C++ LSP (Clangd)
        lspconfig.clangd.setup({})

        -- Additional LSPs
        lspconfig.ruff.setup({})
    end,
}

