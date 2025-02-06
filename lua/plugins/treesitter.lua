return {
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Ensure parsers are installed
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects'  -- Optional: if you want text object support
    },
    config = function()
      -- Setup nvim-treesitter
      require('nvim-treesitter.configs').setup({
        ensure_installed = {"python","c","cpp","java","lua"},  -- Automatically install maintained parsers
        sync_install = false,  -- Install parsers asynchronously
        highlight = {
          enable = true,  -- Enable syntax highlighting
          disable = {},   -- Disable for specific filetypes if needed
        },
        indent = {
          enable = true,  -- Enable smart indentation
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,  -- Enable lookahead for better selection
            keymaps = {
              ["af"] = "@function.outer",  -- Select entire function
              ["if"] = "@function.inner",  -- Select inner function
              ["ac"] = "@class.outer",     -- Select entire class
              ["ic"] = "@class.inner",     -- Select inner class
            },
          },
        },
      })

      -- Set indentation for C and C++ files to 2 spaces
      vim.api.nvim_exec([[
        augroup cpp_c_indent
          autocmd!
          autocmd FileType c,cpp setlocal tabstop=2 shiftwidth=2 softtabstop=2
        augroup END
      ]], false)
    end
  }
}

