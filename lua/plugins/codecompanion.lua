return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  opts = {
    strategies = {
      chat = { adapter = 'anthropic' },
      inline = { adapter = 'anthropic' },
    },

    adapters = {
      anthropic = function()
        return require('codecompanion.adapters').extend('anthropic', {
          env = {
            api_key = vim.env.ANTHROPIC_API_KEY,
          },
          schema = {
            model = {
              default = 'claude-sonnet-4-20250514',
            },
          },
        })
      end,
    },
  },
}
