return {
  {
    'stevearc/conform.nvim',
    config = function()
      -- Configure conform.nvim for specific formatters
      require('conform').setup({
        formatters_by_ft = {
          python = { 'black' },
          c = { 'clang-format' },
          cpp = { 'clang-format' },
        },
      })

      -- Auto format on save for Python, C, and C++
      vim.api.nvim_exec([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.py,*.c,*.cpp lua require('conform').format()
        augroup END
      ]], true)

      -- Manual format with Space + fm
      vim.api.nvim_set_keymap('n', '<Space>fm', '<cmd>lua require("conform").format()<CR>', { noremap = true, silent = true })
    end
  }
}

