return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      -- Set Space as leader key
      vim.g.mapleader = ' '  -- You can use this if it's not already set

      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Enable current line blame permanently
          gitsigns.toggle_current_line_blame()

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({'[c', bang = true})
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk)
          map('n', '<leader>hr', gitsigns.reset_hunk)

          map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end)

          map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end)

          map('n', '<leader>hS', gitsigns.stage_buffer)
          map('n', '<leader>hR', gitsigns.reset_buffer)
          map('n', '<leader>hp', gitsigns.preview_hunk)
          map('n', '<leader>hi', gitsigns.preview_hunk_inline)

          map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end)

          map('n', '<leader>hd', gitsigns.diffthis)

          map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
          end)

          map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
          map('n', '<leader>hq', gitsigns.setqflist)

          -- Toggles
          map('n', '<leader>td', gitsigns.toggle_deleted)
          map('n', '<leader>tw', gitsigns.toggle_word_diff)

          -- Text object
          map({'o', 'x'}, 'ih', gitsigns.select_hunk)
        end
      }
    end
  }
}

--[[
Keybindings
Navigation:
- ]c: Go to the next hunk (or to the next diff if in diff mode).
- [c: Go to the previous hunk (or to the previous diff if in diff mode).

Actions:
<leader>hs: Stage the current hunk.
<leader>hr: Reset the current hunk.
<leader>hS: Stage the entire buffer.
<leader>hR: Reset the entire buffer.
<leader>hp: Preview the current hunk.
<leader>hi: Preview the current hunk inline.
<leader>hb: Blame the current line (full).
<leader>hd: Show the diff of the current hunk.
<leader>hD: Show the diff against the commit (~).
<leader>hQ: Set the quickfix list to show all hunks.
<leader>hq: Set the quickfix list.

Toggles:
<leader>td: Toggle showing deleted lines.
<leader>tw: Toggle word diff.

Text Object:
ih: Select the current hunk in operator-pending and visual modes.
]]
