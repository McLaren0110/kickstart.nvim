return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {},
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      require('dap-python').setup 'python'
      vim.keymap.set('n', '<leader>db', ":lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dc', ":lua require'dap'.continue()<CR>", { desc = 'Start/Continue Debugging' })
      vim.keymap.set('n', '<leader>do', ":lua require'dap'.step_over()<CR>", { desc = 'Step Over' })
      vim.keymap.set('n', '<leader>di', ":lua require'dap'.step_into()<CR>", { desc = 'Step Into' })
    end,
  },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.python = { 'isort', 'black' }
    end,
  },
  {
    'vim-test/vim-test',
    config = function()
      vim.g['test#strategy'] = 'neovim'
      vim.g['test#python#runner'] = 'pytest'
      vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = 'Run Nearest Test' })
      vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = 'Run Test File' })
      vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { desc = 'Run Test Suite' })
    end,
  },
}
