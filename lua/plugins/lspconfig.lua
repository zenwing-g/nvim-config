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
      "marksman", -- Markdown LSP
    }

    -- Setup Mason
    mason.setup({
      ui = { border = "rounded" },
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
      lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Command to install all Mason tools manually
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(servers, " "))
    end, {})

    -- Configure diagnostic settings
    vim.diagnostic.config({
      update_in_insert = false,  -- Prevent updating diagnostics in insert mode
      virtual_text = false,      -- Start with virtual text disabled
      signs = true,              -- Enable error signs next to line numbers
      underline = true,          -- Underline errors
      severity_sort = true,      -- Sort errors by severity
    })

    -- Autocommands to toggle virtual text based on mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:n",  -- When entering normal mode
      callback = function()
        vim.diagnostic.config({ virtual_text = true })
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "n:*",  -- When leaving normal mode
      callback = function()
        vim.diagnostic.config({ virtual_text = false })
      end,
    })
  end,
}

