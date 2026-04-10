return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  opts = {
    strategies = {
      chat = { adapter = 'mistral' },
      inline = { adapter = 'mistral' },
    },

    adapters = {
      mistral = function()
        return require('codecompanion.adapters').extend('openai', {
          env = {
            api_key = vim.env.MISTRAL_API_KEY,
            url = 'https://api.mistral.ai/v1/chat/completions',
          },

          headers = {
            ['Content-Type'] = 'application/json',
            ['Authorization'] = 'Bearer ' .. vim.env.MISTRAL_API_KEY,
          },

          parameters = {
            model = 'mistral-small', -- safe default
            temperature = 0.2,
            stream = false, -- critical
          },

          schema = {
            model = {
              default = 'mistral-small',
            },
          },
        })
      end,
    },
  },
}
