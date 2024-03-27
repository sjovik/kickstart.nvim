return { -- Autoformat
  'stevearc/conform.nvim',
  opts = {
    -- log_level = vim.log.levels.DEBUG,
    notify_on_error = true,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      jsonc = { { 'prettierd', 'prettier' } },
      markdown = { { 'prettierd', 'prettier' } },
    },
  },
}
