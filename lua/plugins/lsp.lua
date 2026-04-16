return {
  'neovim/nvim-lspconfig',

  dependencies = {
    -- Package manager for LSP servers and external tools
    { 'mason-org/mason.nvim', config = true },

    -- Maps Mason package names to lspconfig server names
    'mason-org/mason-lspconfig.nvim',

    -- Ensures required LSPs and tools are installed
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- LSP progress and status notifications
    {
      'j-hui/fidget.nvim',
      opts = {
        notification = {
          window = {
            winblend = 0,
          },
        },
      },
    },

    -- Extends LSP capabilities for nvim-cmp completion
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()
    -- =========================================================
    -- LSP keymaps and buffer-local features
    -- =========================================================
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
      callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        -- Helper for buffer-local LSP keymaps
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, {
            buffer = event.buf,
            desc = 'LSP: ' .. desc,
          })
        end

        -- Navigation
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Symbols and actions
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- Highlight references under cursor
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_group = vim.api.nvim_create_augroup('user-lsp-highlight', { clear = false })

          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_group,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_group,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('user-lsp-detach', { clear = true }),
            callback = function(detach_event)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds {
                group = 'user-lsp-highlight',
                buffer = detach_event.buf,
              }
            end,
          })
        end

        -- Toggle inlay hints when supported
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    -- =========================================================
    -- Shared LSP capabilities
    -- =========================================================
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- =========================================================
    -- Python virtualenv detection
    -- =========================================================
    local function get_python_path(workspace)
      for _, pattern in ipairs { 'venv', '.venv' } do
        local python = workspace .. '/' .. pattern .. '/bin/python'
        if vim.fn.executable(python) == 1 then
          return python
        end
      end
      return 'python3'
    end

    -- =========================================================
    -- Language server configuration
    -- =========================================================
    local servers = {
      cssls = {},
      dockerls = {},

      -- HTML with extra template filetypes
      html = {
        filetypes = { 'html', 'twig', 'hbs' },
      },

      jsonls = {},

      -- Lua settings for Neovim development
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            runtime = {
              version = 'LuaJIT',
            },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file('', true),
            },
            diagnostics = {
              globals = { 'vim' },
              disable = { 'missing-fields' },
            },
            format = {
              enable = false,
            },
          },
        },
      },

      openscad_lsp = {},

      -- Disabled in favor of pyright + ruff
      pylsp = {
        enabled = false,
      },

      -- Python LSP using project-local virtualenv when available
      pyright = {
        cmd = { get_python_path(vim.fn.getcwd()), '-m', 'pyright' },
        settings = {
          python = {
            pythonPath = get_python_path(vim.fn.getcwd()),
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
              typeCheckingMode = 'basic',
            },
          },
        },
      },

      -- Fast Python linting
      ruff = {},

      sqlls = {},
      tailwindcss = {},
      terraformls = {},

      -- React / TypeScript support
      vtsls = {
        filetypes = {
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
        },
      },

      yamlls = {},
    }

    -- =========================================================
    -- Ensure required tools are installed
    -- =========================================================
    local ensure_installed = vim.tbl_keys(servers)
    vim.list_extend(ensure_installed, {
      'stylua',
      'black',
    })

    require('mason-tool-installer').setup {
      ensure_installed = ensure_installed,
    }

    -- =========================================================
    -- Register and enable all configured servers
    -- =========================================================
    for server, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, config.capabilities or {})

      vim.lsp.config(server, config)
      vim.lsp.enable(server)
    end
  end,
}
