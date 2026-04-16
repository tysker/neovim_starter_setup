return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      override_by_filename = {
        ['.env'] = {
          icon = '󰒓',
          color = '#6d8086',
          name = 'Env',
        },
        ['.env.example'] = {
          icon = '󰒓',
          color = '#6d8086',
          name = 'EnvExample',
        },
        ['package.json'] = {
          icon = '',
          color = '#e8274b',
          name = 'PackageJson',
        },
        ['package-lock.json'] = {
          icon = '',
          color = '#7a0d21',
          name = 'PackageLockJson',
        },
        ['tsconfig.json'] = {
          icon = '',
          color = '#519aba',
          name = 'TsConfig',
        },
        ['tsconfig.node.json'] = {
          icon = '',
          color = '#519aba',
          name = 'TsConfigNode',
        },
        ['vite.config.ts'] = {
          icon = '⚡',
          color = '#f2a541',
          name = 'ViteConfig',
        },
        ['README.md'] = {
          icon = '󰍔',
          color = '#42a5f5',
          name = 'Readme',
        },
      },
      override_by_extension = {
        ts = {
          icon = '',
          color = '#519aba',
          name = 'Ts',
        },
        tsx = {
          icon = '',
          color = '#519aba',
          name = 'Tsx',
        },
        jsx = {
          icon = '',
          color = '#f5c06f',
          name = 'Jsx',
        },
        json = {
          icon = '',
          color = '#cbcb41',
          name = 'Json',
        },
        md = {
          icon = '󰍔',
          color = '#42a5f5',
          name = 'Markdown',
        },
      },
    }
  end,
}
