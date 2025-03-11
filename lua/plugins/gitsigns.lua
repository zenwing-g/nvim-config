--[[
Keybinds:
<leader>hs  -> Stage current hunk
<leader>hr  -> Reset current hunk
<leader>hS  -> Stage entire buffer
<leader>hR  -> Reset entire buffer
<leader>hp  -> Preview hunk
<leader>hi  -> Preview hunk inline
<leader>hb  -> Git blame for the current line
<leader>hd  -> Show Git diff (against index)
<leader>hD  -> Show Git diff (against last commit)
<leader>hQ  -> Add all hunks to quickfix list
<leader>hq  -> Add file's hunks to quickfix list
<leader>td  -> Toggle deleted lines
<leader>tw  -> Toggle word diffs
ih          -> Git hunk text object (for operator & visual mode)
[c / ]c     -> Navigate between hunks
]]

return {
	{
		-- Plugin: gitsigns.nvim (Git integration for Neovim)
		"lewis6991/gitsigns.nvim",

		-- Plugin configuration
		config = function()
			-- Set the leader key to space
			vim.g.mapleader = " "

			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					-- Helper function for mapping keys in the buffer
					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Enable inline blame for the current line
					gitsigns.toggle_current_line_blame()

					-- Navigation between Git hunks (changes)
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true }) -- Default behavior in diff mode
						else
							gitsigns.nav_hunk("next") -- Move to the next hunk
						end
					end)
					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true }) -- Default behavior in diff mode
						else
							gitsigns.nav_hunk("prev") -- Move to the previous hunk
						end
					end)

					-- Hunk staging and resetting
					map("n", "<leader>hs", gitsigns.stage_hunk) -- Stage current hunk
					map("n", "<leader>hr", gitsigns.reset_hunk) -- Reset current hunk

					-- Stage/reset hunks in visual mode
					map("v", "<leader>hs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					map("v", "<leader>hr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)

					-- Stage/reset the entire buffer
					map("n", "<leader>hS", gitsigns.stage_buffer) -- Stage all changes in the buffer
					map("n", "<leader>hR", gitsigns.reset_buffer) -- Reset all changes in the buffer

					-- Preview changes
					map("n", "<leader>hp", gitsigns.preview_hunk) -- Show a preview of the hunk
					map("n", "<leader>hi", gitsigns.preview_hunk_inline) -- Show inline preview

					-- Git blame & diff functionality
					map("n", "<leader>hb", function()
						gitsigns.blame_line({ full = true }) -- Show full blame details
					end)
					map("n", "<leader>hd", gitsigns.diffthis) -- Diff against index
					map("n", "<leader>hD", function()
						gitsigns.diffthis("~") -- Diff against last commit
					end)

					-- Quickfix list management
					map("n", "<leader>hQ", function()
						gitsigns.setqflist("all")
					end) -- Add all hunks to quickfix list
					map("n", "<leader>hq", gitsigns.setqflist) -- Add current file hunks to quickfix list

					-- Toggle Git-related views
					map("n", "<leader>td", gitsigns.toggle_deleted) -- Show deleted lines
					map("n", "<leader>tw", gitsigns.toggle_word_diff) -- Highlight word-level diffs

					-- Text object for selecting hunks
					map({ "o", "x" }, "ih", gitsigns.select_hunk)
				end,
			})
		end,
	},
}
