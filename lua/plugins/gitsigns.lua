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

    vim.keymap.set('n', '<leader>gg', ':Gitsigns<CR>', { desc = '[G]itline [G]it commands' })
    vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle [G]it [B]lame line' })
    vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { desc = 'Toggle [G]it [H]unks' })
  end,
}
