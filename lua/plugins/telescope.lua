return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", "catppuccin/nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
          winblend = 10,
          border = true,
          color_devicons = true,
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
      require("catppuccin").setup({
        integrations = {
          telescope = true,
        },
      })
      vim.cmd([[
        augroup TelescopeBackground
          autocmd!
          autocmd ColorScheme catppuccin highlight NormalFloat guibg=NONE
          autocmd ColorScheme catppuccin highlight TelescopeNormal guibg=NONE
          autocmd ColorScheme catppuccin highlight TelescopeBorder guifg=#1f1f1f
        augroup END
      ]])
      vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
    end,
  }
}
