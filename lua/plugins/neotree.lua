return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      -- =========================================================
      -- Neo-tree keymaps
      -- =========================================================
      vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
      vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', {
        noremap = true,
        silent = true,
      })
      vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>', {
        noremap = true,
        silent = true,
      })

      -- =========================================================
      -- Neo-tree UI setup
      -- =========================================================
      require('neo-tree').setup {
        default_component_configs = {
          -- File and folder icons
          icon = {
            folder_closed = '',
            folder_open = '',
            folder_empty = '󰜌',
            default = '',
            highlight = 'NeoTreeFileIcon',
          },

          -- Git status symbols shown in the tree
          git_status = {
            symbols = {
              added = '✚',
              modified = '',
              deleted = '✖',
              renamed = '󰁕',
              untracked = '',
              ignored = '',
              unstaged = '󰄱',
              staged = '',
              conflict = '',
            },
          },
        },
      }
    end,
  },

  {
    -- Keeps LSP rename/create/delete operations in sync with the file tree
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-neo-tree/neo-tree.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },

  {
    -- Window picker for actions like opening files in splits
    's1n7ax/nvim-window-picker',
    version = '2.*',
    config = function()
      require('window-picker').setup {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
            buftype = { 'terminal', 'quickfix' },
          },
        },
      }
    end,
  },
}
