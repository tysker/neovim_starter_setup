return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvimtools/none-ls-extras.nvim' },
  config = function()
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.diagnostics.checkmake,
        require 'none-ls.diagnostics.eslint_d',
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.yamllint,
      },
    }
  end,
}
