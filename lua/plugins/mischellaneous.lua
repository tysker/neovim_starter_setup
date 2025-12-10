return {
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

  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'quarto' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim',
    },

    opts = {
      render_modes = { 'n', 'c', 't' }, -- normal, command, terminal
      heading = {
        enabled = false,
      },
      code = {
        enabled = true,
        border = 'rounded',
      },
    },
  },

  -- Preview markdown live in web browser
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      -- define the custom browser function in Vimscript
      vim.cmd [[
      function! OpenMarkdownPreview(url)
        " Start Firefox as a background job with URL
        call jobstart(['firefox', '--new-window', a:url])
      endfunction
    ]]

      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
      vim.g.mkdp_theme = 'dark'
    end,
  },
}
