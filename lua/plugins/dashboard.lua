return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          " ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ",
          " ████╗  ██║██║   ██║██║████╗ ████║ ",
          " ██╔██╗ ██║██║   ██║██║██╔████╔██║ ",
          " ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          " ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        },
        shortcut = {
          { desc = "󰍉  Find File", group = "DashboardShortCut", action = "Telescope find_files", key = "f" },
          { desc = "󰍑  Recent Files", group = "DashboardShortCut", action = "Telescope oldfiles", key = "r" },
          { desc = "  New File", group = "DashboardShortCut", action = "ene | startinsert", key = "n" },
          { desc = "󰗼  Quit", group = "DashboardShortCut", action = "qa", key = "q" },
        },
        footer = { "🚀 Ready to Code!" },
      },
    })
  end,
}
