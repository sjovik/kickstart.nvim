return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      local harpoon = require 'harpoon'
      local list = harpoon:list()

      local function get_current_mark()
        local root_dir = list.config:get_root_dir()
        local current_file_path = vim.api.nvim_buf_get_name(0)
        for i = 1, list:length() do
          local list_item_path = list:get(i).value
          local full_path = root_dir .. '/' .. list_item_path

          if full_path == current_file_path then
            return tostring(i)
          end
        end
        return '-'
      end

      local function harpoon_component()
        local total_marks = #list.items

        if total_marks == 0 then
          return ''
        end

        local current_mark = get_current_mark()

        -- return string.format('%s/%d', current_mark, total_marks)
        return string.format('󰛢 %s/%d', current_mark, total_marks)
      end

      ---@diagnostic disable: undefined-field
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          globalstatus = true,
          component_separators = { left = '▕ ', right = '▕ ' },
          section_separators = { left = '█', right = '█' },
        },
        sections = {
          lualine_b = {
            { 'branch', icon = '' },
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
