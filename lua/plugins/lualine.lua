return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      local harpoon = require 'harpoon'
      local list = harpoon:list()
      local ui = require 'harpoon.list'

      local function harpoon_component()
        local total_marks = #list.items

        if total_marks == 0 then
          return ''
        end

        local current_mark = '-'

        local mark_i = 2
        if mark_i ~= nil then
          current_mark = tostring(mark_i)
        end

        return string.format(' %s/%d', current_mark, total_marks)
      end

      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          globalstatus = true,
          component_separators = { left = '▕', right = '▕' },
          section_separators = { left = '█', right = '█' },
        },
        sections = {
          lualine_b = {
            harpoon_component,
            'diff',
            'diagnostics',
          },
          lualine_c = {
            { 'filename', path = 1 },
          },
          lualine_x = {
            'filetype',
          },
        },
      }
    end,
  },
}
