return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = {
    'williamboman/mason.nvim',
  },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {

        -- =====================
        -- LSP SERVERS
        -- =====================
        'ansible-language-server', -- Ansible playbooks, inventories, roles
        'lua-language-server', -- Lua (Neovim configs, plugins, etc.)
        'dockerfile-language-server', -- Dockerfile completions & diagnostics
        'pyright',
        'typescript-language-server', -- JS/TS via tsserver
        'tailwindcss-language-server', -- Tailwind CSS class IntelliSense
        'html-lsp', -- HTML tags, attributes, completions
        'json-lsp', -- JSON schema validation & assistance
        'yaml-language-server', -- YAML validation & schema support
        'html-lsp',
        'css-lsp',
        'openscad-lsp', -- OpenSCAD, written in Rust
        'sqlls', -- SQL queries & dialect support
        'terraform-ls', -- Terraform blocks, providers, modules

        -- =====================
        -- FORMATTERS (Conform)
        -- =====================
        'stylua',
        'ruff',
        'prettierd',
        'shfmt',

        -- =====================
        -- LINTERS / DIAGNOSTICS (none-ls)
        -- =====================
        'eslint_d',
        'yamllint',
        'ansible-lint',
        'checkmake',
      },

      auto_update = false,
      run_on_start = true,
      start_delay = 3000, -- wait for Mason to be ready
    }
  end,
}
