-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do

return { -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      current_line_blame_opts = {
        delay = 300,
      },
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'rounded',
        title = ' Preview hunk ',
        title_pos = 'left',
        row = 1,
        col = 2,
      },
    }

    local gitsigns = require 'gitsigns'

    vim.keymap.set('n', '<leader>gg', ':Gitsigns<CR>', { desc = '[G]itline [G]it commands' })
    vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, { desc = 'Toggle [G]it [B]lame line' })
    vim.keymap.set('n', '<leader>gh', gitsigns.preview_hunk, { desc = 'Toggle [G]it [H]unks' })
    vim.keymap.set('n', '<leader>gn', function()
      gitsigns.nav_hunk 'next'
    end, { desc = 'Jump to [G]it [N]ext hunk' })
    vim.keymap.set('n', '<leader>gp', function()
      gitsigns.nav_hunk 'prev'
    end, { desc = 'Jump to [G]it [P]rev hunk' })
    vim.keymap.set('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[G]it [s]tage Hunk' })
    vim.keymap.set('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[G]it [S]tage Buffer' })
  end,
}
