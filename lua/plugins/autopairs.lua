return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({
        -- Add custom configuration options here
        check_ts = true,  -- Enable treesitter integration for better pairing
        disable_filetype = { "TelescopePrompt", "vim" },  -- Disable in specific filetypes
      })
    end
  }
}
