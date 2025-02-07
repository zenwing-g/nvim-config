return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8", -- or branch = "0.1.x"
    dependencies = { "nvim-lua/plenary.nvim", "catppuccin/nvim" }, -- Ensure Catppuccin is included
    config = function()
      -- Apply Catppuccin theme to Telescope
      require("telescope").setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
          winblend = 10, -- Make Telescope background semi-transparent
          border = true, -- Keep the border
          color_devicons = true,
          theme = "catppuccin", -- Use Catppuccin for UI
        },
      })

      -- Disable Catppuccin background for Telescope (while keeping border)
      vim.cmd([[
        augroup TelescopeBackground
          autocmd!
          autocmd ColorScheme catppuccin highlight NormalFloat guibg=NONE
          autocmd ColorScheme catppuccin highlight TelescopeNormal guibg=NONE
          autocmd ColorScheme catppuccin highlight TelescopeBorder guibg=#1f1f1f -- Set border color if needed
        augroup END
      ]])

      -- Define keymaps for Telescope commands
      vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
    end,
  }
}

