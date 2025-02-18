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
    local servers = {
      "pyright",
      "clangd",
      "ruff",
      "marksman",
    }
    mason.setup({
      ui = { border = "rounded" },
    })
    mason_lspconfig.setup({
      ensure_installed = servers,
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
    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(servers, " "))
    end, {})
    vim.diagnostic.config({
      update_in_insert = false,
      virtual_text = false,
      signs = true,
      underline = true,
      severity_sort = true,
    })
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
