return {
  'nvimtools/none-ls.nvim',

  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },

  config = function()
    local null_ls = require 'null-ls'
    local diagnostics = null_ls.builtins.diagnostics

    -- =========================================================
    -- Ensure external diagnostic tools are installed
    -- =========================================================
    require('mason-null-ls').setup {
      ensure_installed = {
        'checkmake',
        'eslint_d',
        'ansible-lint',
        'yamllint',
      },
      automatic_installation = true,
    }

    -- =========================================================
    -- Register additional diagnostics sources
    -- =========================================================
    -- These complement LSP servers with external linters
    null_ls.setup {
      -- debug = true, -- Enable and inspect with :NullLsLog

      sources = {
        diagnostics.checkmake,
        require 'none-ls.diagnostics.eslint_d',
        diagnostics.ansiblelint,
        diagnostics.yamllint,
      },
    }
  end,
}
