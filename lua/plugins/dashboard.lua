return {
  "glepnir/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        header = {
          " ███╗   ██╗██████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
          " ████╗  ██║██╔═══╝██╔═══██╗██║   ██║██║████╗ ████║ ",
          " ██╔██╗ ██║██████╗██║   ██║██║   ██║██║██╔████╔██║ ",
          " ██║╚██╗██║██╔═══╝██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
          " ██║ ╚████║██████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
          " ╚═╝  ╚═══╝╚═════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        },
        shortcut = {
          { desc = "󰍉  Find File", group = "DashboardShortCut", action = "Telescope find_files", key = "f" },
          { desc = "󰍑  Recent Files", group = "DashboardShortCut", action = "Telescope oldfiles", key = "r" },
          { desc = "  New File", group = "DashboardShortCut", action = "ene | startinsert", key = "n" },
          { desc = "󰗼  Quit", group = "DashboardShortCut", action = "qa", key = "q" },
        },
      footer = { "","I fear not the man who has 10,000 solutions to one problem","but I fear the man who has 1 solution for 10,000 problems."," ~ Brute Lee ~" },
      },
    })
  end,
}
