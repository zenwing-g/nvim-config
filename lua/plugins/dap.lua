return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",         -- UI for DAP (Debug Adapter Protocol)
      "mfussenegger/nvim-dap-python", -- Python-specific DAP support
      "theHamsta/nvim-dap-virtual-text", -- Inline variable display
      "nvim-neotest/nvim-nio" -- Required dependency for nvim-dap-ui
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      -- Set up Python DAP
      dap_python.setup("python") -- Uses system's Python, change if needed

      -- UI Setup
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Set up LLDB for C/C++
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/lib/llvm-18/bin/lldb-dap", -- Ensure this path is correct
        name = "lldb"
      }

      -- C/C++ Debugging Configurations
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }
      dap.configurations.c = dap.configurations.cpp

      -- Keybindings
      vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dB", function() 
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) 
      end, { desc = "Set Conditional Breakpoint" })
      vim.keymap.set("n", "<Leader>dr", function() dap.repl.open() end, { desc = "Open Debug Console (REPL)" })
      vim.keymap.set("n", "<Leader>du", function() dapui.toggle() end, { desc = "Toggle DAP UI" })
    end
  }
}

