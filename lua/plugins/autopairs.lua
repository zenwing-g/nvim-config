return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup({
        -- Add custom configuration options here
        check_ts = true,  -- Enable treesitter integration for better pairing
        disable_filetype = { "TelescopePrompt", "vim" },  -- Disable in specific filetypes
        fast_wrap = {
          map = "<M-e>",  -- Use Alt+e to quickly wrap text
          chars = { "{", "[", "(", '"', "'" },
          pattern = string.gsub([[ [%'%"%)%>%]%)%} ]],"%s+", ""),
          offset = 0,
          end_key = "$",
          keys = "qwertyuiopzxcvbnmasdfghjkl",
          check_comma = true,
        },
      })
    end
  }
}
