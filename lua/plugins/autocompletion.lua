return {
  'hrsh7th/nvim-cmp',

  dependencies = {
    -- Snippet engine
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        -- Enable regex snippet support when available
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            -- Load VS Code style snippets lazily
            require('luasnip.loaders.from_vscode').lazy_load {
              -- issue with friendly-snippets inside a for-loop
              exclude = { 'sh', 'bash' }, -- don't load bash snippets
            }

            -- Extend React filetypes with HTML/JS snippets
            local luasnip = require 'luasnip'
            luasnip.filetype_extend('javascriptreact', { 'html', 'javascript' })
            luasnip.filetype_extend('typescriptreact', { 'html', 'typescript', 'javascript' })
          end,
        },
      },
    },

    -- Completion sources
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
  },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- =========================================================
    -- Snippet setup
    -- =========================================================
    luasnip.config.setup {}

    -- =========================================================
    -- Completion item icons
    -- =========================================================
    local kind_icons = {
      Text = '󰉿',
      Method = 'm',
      Function = '󰊕',
      Constructor = '',
      Field = '',
      Variable = '󰆧',
      Class = '󰌗',
      Interface = '',
      Module = '',
      Property = '',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰇽',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰊄',
    }

    cmp.setup {
      -- Expand snippet bodies returned by LSP/snippets
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Show completion menu without inserting immediately
      completion = {
        completeopt = 'menu,menuone,preview',
        -- completeopt = 'menu,menuone,noinsert',
      },

      -- Prefer LSP results for imports and language-aware suggestions
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          function(entry1, entry2)
            if entry1.source.name == 'nvim_lsp' and entry2.source.name ~= 'nvim_lsp' then
              return true
            elseif entry2.source.name == 'nvim_lsp' and entry1.source.name ~= 'nvim_lsp' then
              return false
            end
          end,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },

      -- =========================================================
      -- Completion and snippet keymaps
      -- =========================================================
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},

        -- Confirm the selected completion item
        ['<CR>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm {
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }
          else
            fallback()
          end
        end),

        -- Jump forward/backward through snippet fields
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),

        -- Tab navigates completion first, then snippets
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },

      -- =========================================================
      -- Completion sources
      -- =========================================================
      sources = {
        {
          name = 'lazydev',
          group_index = 0, -- avoid duplicate LuaLS suggestions
        },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'path' },
      },

      -- =========================================================
      -- Menu formatting
      -- =========================================================
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          vim_item.kind = kind_icons[vim_item.kind] or ''
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      },
    }
  end,
}
