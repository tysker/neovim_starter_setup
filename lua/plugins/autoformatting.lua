return {
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- Formatters & linters for mason to install
require('mason-null-ls').setup {
  ensure_installed = {

    --------------------------------------------------------------------------
    -- LSP SERVERS
    --------------------------------------------------------------------------
    'ansible-language-server',        -- Ansible playbooks, inventories, roles
    'css-lsp',                        -- CSS language features
    'dockerfile-language-server',     -- Dockerfile completions & diagnostics
    'html-lsp',                       -- HTML tags, attributes, completions
    'json-lsp',                       -- JSON schema validation & assistance
    'lua-language-server',            -- Lua (Neovim configs, plugins, etc.)
    'python-lsp-server',              -- Python LSP (rope, pycodestyle, etc.)
    'sqlls',                          -- SQL queries & dialect support
    'tailwindcss-language-server',    -- Tailwind CSS class IntelliSense
    'terraform-ls',                   -- Terraform blocks, providers, modules
    'typescript-language-server',     -- JS/TS via tsserver
    'yaml-language-server',           -- YAML validation & schema support

    --------------------------------------------------------------------------
    -- FORMATTERS
    --------------------------------------------------------------------------
    'prettierd',                      -- Fast Prettier daemon for web files
    'shfmt',                          -- Shell script formatter
    'stylua',                         -- Lua code formatter

    --------------------------------------------------------------------------
    -- LINTERS / DIAGNOSTICS
    --------------------------------------------------------------------------
    'checkmake',                      -- Makefile linter
    'eslint_d',                       -- Fast JS/TS linter daemon
    'ansible-lint',		      -- Ansible Lint
    'yamlint',			      -- Linter for yaml files
  },

  automatic_installation = true,
}


    local sources = {
      diagnostics.checkmake,
      formatting.prettierd.with {
        filetypes = {
          'html',
          'json',
          'yaml',
          'markdown',
          'typescriptreact',
          'javascriptreact',
          'javascript',
          'typescript',
          'css',
          'scss',
          'lua',
          'sh',
          'cfg',
        },
      },
      formatting.stylua,
      formatting.shfmt.with { args = { '-i', '4' } },
      formatting.terraform_fmt,
      require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
      require 'none-ls.formatting.ruff_format',
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client:supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { async = false }
            end,
          })
        end
      end,
    }
  end,
}
