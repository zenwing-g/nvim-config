return {
  {
    'stevearc/conform.nvim',
    config = function()
      require('conform').setup({
        formatters_by_ft = {
          python = { 'black' },
          c = { 'clang-format' },
          cpp = { 'clang-format' },
        },
      })
      vim.api.nvim_exec([[
        augroup FormatAutogroup
          autocmd!
          autocmd BufWritePost *.py,*.c,*.cpp lua require('conform').format()
        augroup END
      ]], true)
      vim.api.nvim_set_keymap('n', '<Space>fm', '<cmd>lua require("conform").format()<CR>', { noremap = true, silent = true })
    end
  }
}
