return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'mike-jl/harpoonEx' },
  config = function()
    local harpoon = require 'harpoon'
    local harpoonEx = require 'harpoonEx'
    local actions = require('telescope').extensions.harpoonEx.actions

    -- REQUIRED
    harpoon:setup {}
    -- REQUIRED

    -- load extension
    harpoon:extend(harpoonEx.extend())

    -- check if nvim was started with no arguments or just a dir as argument
    -- if so, try to select the first item in the harpoon list
    if
      (vim.fn.argc() == 0 or (vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1))
      and vim.api.nvim_get_option_value('buftype', { buf = 0 }) == ''
    then
      vim.schedule(function()
        harpoonEx.next_harpoon(harpoon:list(), false)
      end)
    end

    vim.keymap.set('n', '<A-e>', function()
      require('telescope').extensions.harpoonEx.harpoonEx {
        -- Optional: modify mappings, default mappings:
        attach_mappings = function(_, map)
          -- local actions = require('telescope').extensions.harpoonEx.actions
          map({ 'i', 'n' }, '<A-d>', actions.delete_mark)
          map({ 'i', 'n' }, '<A-k>', actions.move_mark_up)
          map({ 'i', 'n' }, '<A-j>', actions.move_mark_down)
          return true
        end,
      }
      return true
    end, { desc = 'Open harpoon window' })

    vim.keymap.set('n', '<A-a>', function()
      harpoon:list():add()
    end, { desc = '[A]ppend harpoon' })

    -- toggle next / previous harpoon
    vim.keymap.set('n', '<S-Tab>', function()
      harpoonEx.next_harpoon(harpoon:list(), true)
    end, { desc = 'Switch to previous buffer in Harpoon List' })
    vim.keymap.set('n', '<Tab>', function()
      harpoonEx.next_harpoon(harpoon:list(), false)
    end, { desc = 'Switch to next buffer in Harpoon List' })

    vim.keymap.set('n', '<A-1>', function()
      harpoon:list():select(1)
    end, { desc = 'harpoon 1' })
    vim.keymap.set('n', '<A-2>', function()
      harpoon:list():select(2)
    end, { desc = 'harpoon 2' })
    vim.keymap.set('n', '<A-3>', function()
      harpoon:list():select(3)
    end, { desc = 'harpoon 3' })
    vim.keymap.set('n', '<A-4>', function()
      harpoon:list():select(4)
    end, { desc = 'harpoon 4' })
    vim.keymap.set('n', '<A-8>', function()
      harpoon:list():select(5)
    end, { desc = 'harpoon 5' })
    vim.keymap.set('n', '<A-9>', function()
      harpoon:list():select(6)
    end, { desc = 'harpoon 6' })
    vim.keymap.set('n', '<A-0>', function()
      harpoon:list():select(7)
    end, { desc = 'harpoon 7' })

    -- Live grep harpoon files
    vim.keymap.set('n', '<leader>sj', function()
      harpoonEx.telescope_live_grep(harpoon:list())
    end, { desc = 'Live grep harpoon files' })
    --
    -- -- Toggle previous & next buffers stored within Harpoon list
    -- vim.keymap.set('n', '<A-p>', function()
    --   harpoon:list():prev()
    -- end, { desc = '[P]rev harpoon buffer' })
    -- vim.keymap.set('n', '<A-n>', function()
    --   harpoon:list():next()
    -- end, { desc = '[N]ext harpoon buffer' })
  end,
}
