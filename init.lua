-- =======================================================
-- Core config (options + keymaps)
-- =======================================================
require 'core.options' -- General editor settings
require 'core.keymaps' -- Keymaps
require 'core.snippets' -- Custom snippet definitions

-- =======================================================
-- Lazy.nvim bootstrap
-- =======================================================
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazyrepo,
    lazypath,
  }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

-- =======================================================
-- Lazy.nvim plugin loader
-- =======================================================
require('lazy').setup({

  -- FIRST ARGUMENT: Plugin specs
  require 'plugins.neotree',
  require 'plugins.treesitter',
  require 'plugins.bufferline',
  require 'plugins.lualine',
  require 'plugins.telescope',
  require 'plugins.lsp',
  require 'plugins.autocompletion',
  require 'plugins.autoformatting',
  require 'plugins.gitsigns',
  require 'plugins.alpha',
  require 'plugins.indent-blankline',
  require 'plugins.mischellaneous',
  require 'plugins.comment',
  require 'plugins.rainbowbrackets',

  -- Themes
  require 'themes.catppuccintheme',
  -- require 'plugins.nordtheme',
}, {

  -- =====================================================
  -- SECOND ARGUMENT: Lazy options (global Lazy settings)
  -- =====================================================

  --------------------------------------------------------
  -- Disable luarocks & hererocks completely
  --------------------------------------------------------
  rocks = {
    enabled = false,
    hererocks = false,
  },

  --------------------------------------------------------
  -- Improve Lazy UI appearance
  --------------------------------------------------------
  ui = {
    border = 'rounded',
    size = { width = 0.85, height = 0.85 },

    icons = {
      loaded = '●',
      not_loaded = '○',
      cmd = ' ',
      config = ' ',
      event = '⚡',
      start = '▶',
      lazy = '󰒲',
    },
  },

  --------------------------------------------------------
  -- Auto-check plugin updates every 24h
  --------------------------------------------------------
  checker = {
    enabled = true,
    frequency = 86400, -- every day
  },

  --------------------------------------------------------
  -- Detect config changes automatically (no reload needed)
  --------------------------------------------------------
  change_detection = {
    enabled = true,
    notify = false,
  },

  --------------------------------------------------------
  -- Performance & startup optimization
  --------------------------------------------------------
  performance = {
    cache = {
      enabled = true, -- Enable caching for plugin metadata
    },
    rtp = {
      disabled_plugins = {
        'netrw',
        'netrwPlugin',
        'netrwSettings',
        'netrwFileHandlers',
        'gzip',
        'tar',
        'tarPlugin',
        'zip',
        'zipPlugin',
        'matchit',
        'matchparen',
        '2html_plugin',
        'tutor',
        'vimball',
        'vimballPlugin',
        'getscript',
        'getscriptPlugin',
        'logipat',
        'rrhelper',
        'spellfile_plugin',
      },
    },
  },

  --------------------------------------------------------
  -- Parallel tasks (fast installs)
  --------------------------------------------------------
  concurrency = 16,
})
