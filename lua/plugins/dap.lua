--[[
Keybindings for nvim-dap:

<F5>        -> Start/Continue debugging
<F10>       -> Step over
<F11>       -> Step into
<F12>       -> Step out
<Leader>db  -> Toggle breakpoint
<Leader>dB  -> Set conditional breakpoint
<Leader>dr  -> Open debug console (REPL)
<Leader>du  -> Toggle DAP UI
]]

return {
	{
		-- Plugin: nvim-dap (Debug Adapter Protocol for Neovim)
		"mfussenegger/nvim-dap",

		-- Dependencies for UI and language support
		dependencies = {
			"rcarriga/nvim-dap-ui", -- UI for debugging
			"mfussenegger/nvim-dap-python", -- Python debugging support
			"theHamsta/nvim-dap-virtual-text", -- Inline virtual text for variables
			"nvim-neotest/nvim-nio", -- Required for dap-ui
		},

		-- Plugin configuration
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")

			-- Setup Python debugging
			dap_python.setup("python")

			-- Setup UI for DAP
			dapui.setup()

			-- Enable virtual text for debugging
			require("nvim-dap-virtual-text").setup()

			-- Configure LLDB adapter for C/C++ debugging
			dap.adapters.lldb = {
				type = "executable",
				command = "/usr/lib/llvm-18/bin/lldb-dap", -- Path to LLDB Debug Adapter
				name = "lldb",
			}

			-- Debugging configurations for C++
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

			-- Use the same configuration for C as for C++
			dap.configurations.c = dap.configurations.cpp

			-- Debugging keybindings
			vim.keymap.set("n", "<F5>", function()
				dap.continue()
			end, { desc = "Start/Continue Debugging" })
			vim.keymap.set("n", "<F10>", function()
				dap.step_over()
			end, { desc = "Step Over" })
			vim.keymap.set("n", "<F11>", function()
				dap.step_into()
			end, { desc = "Step Into" })
			vim.keymap.set("n", "<F12>", function()
				dap.step_out()
			end, { desc = "Step Out" })
			vim.keymap.set("n", "<Leader>db", function()
				dap.toggle_breakpoint()
			end, { desc = "Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>dB", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set Conditional Breakpoint" })
			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "Open Debug Console (REPL)" })
			vim.keymap.set("n", "<Leader>du", function()
				dapui.toggle()
			end, { desc = "Toggle DAP UI" })
		end,
	},
}
