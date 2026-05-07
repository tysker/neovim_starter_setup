local M = {}

M.themes = {
  ['catppuccin-light'] = {
    name = 'catppuccin',
    plugin = 'catppuccin/nvim',
    config = function()
      require('catppuccin').setup {
        flavour = 'latte', -- Light theme
        background = { light = 'latte', dark = 'latte' },
        transparent_background = false,
        integrations = { lualine = { enabled = true } },
      }
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd [[highlight CursorLine guibg=#e6e9ef]]
    end,
  },
  ['catppuccin-dark'] = {
    name = 'catppuccin',
    plugin = 'catppuccin/nvim',
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- Dark theme
        background = { light = 'mocha', dark = 'mocha' },
        transparent_background = false,
        integrations = { lualine = { enabled = true } },
      }
      vim.cmd.colorscheme 'catppuccin'
      vim.cmd [[highlight CursorLine guibg=#313244]]
    end,
  },
  nord = {
    name = 'nord',
    plugin = 'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
      require('nord').set()
      vim.cmd [[highlight CursorLine guibg=#434C5E]]
    end,
  },
  fluoromachine = {
    name = 'fluoromachine',
    plugin = 'maxmx03/fluoromachine.nvim',
    config = function()
      require('fluoromachine').setup {}
      vim.cmd.colorscheme 'fluoromachine'
    end,
  },
  ['gruvbox-light'] = {
    name = 'gruvbox',
    plugin = 'ellisonleao/gruvbox.nvim',
    config = function()
      vim.o.background = 'light'
      vim.cmd.colorscheme 'gruvbox'
      vim.cmd [[highlight CursorLine guibg=#ebdbb2]]
    end,
  },
  ['gruvbox-dark'] = {
    name = 'gruvbox',
    plugin = 'ellisonleao/gruvbox.nvim',
    config = function()
      vim.o.background = 'dark'
      vim.cmd.colorscheme 'gruvbox'
      vim.cmd [[highlight CursorLine guibg=#3c3836]]
    end,
  },
  -- Add more themes here
}

return M
