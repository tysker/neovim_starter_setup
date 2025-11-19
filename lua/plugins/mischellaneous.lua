return {
  -- ONLY if you use tmux panes + neovim splits
  {
    'christoomey/vim-tmux-navigator',
    enabled = true, -- change to false if you don't need it
  },

  -- Auto-detect tabstop + shiftwidth
  { 'tpope/vim-sleuth' },

  -- Git integration inside neovim (optional)
  {
    'tpope/vim-fugitive',
    enabled = true, -- disable if you prefer terminal git
  },

  -- GitHub integration for :Gbrowse (optional)
  {
    'tpope/vim-rhubarb',
    enabled = true, -- disable if not on GitHub
  },

  -- Keybind hints
  { 'folke/which-key.nvim' },

  -- Autoclose () {} '' "" etc.
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  -- Highlight TODO, HACK, BUG, NOTE etc.
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  -- Modern color highlighter (replaces deprecated norcalli version)
  {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  -- Preserves window layout automatically.
  {
    'echasnovski/mini.bufremove',
    version = false,
    config = function()
      vim.keymap.set('n', '<leader>x', function()
        require('mini.bufremove').delete()
      end, { noremap = true, silent = true })
    end,
  },

  -- adds highlights for text filetypes, like markdown, orgmode, and neorg
  -- the plugin is used in connection with the colortheme plugin (headlines)
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
  },
}
