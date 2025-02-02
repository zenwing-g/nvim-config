-- plugins/telescope.lua
return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',  -- or branch = '0.1.x'
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- Define keymaps for Telescope commands
      vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
    end
  }
}

