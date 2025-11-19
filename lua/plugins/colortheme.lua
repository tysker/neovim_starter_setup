return {
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000,

  config = function()
    vim.g.nord_contrast = true
    vim.g.nord_borders = true
    vim.g.nord_disable_background = true
    vim.g.nord_italic = false
    vim.g.nord_uniform_diff_background = true
    vim.g.nord_bold = false

    -- Load the colorscheme
    require('nord').set()

    vim.cmd [[highlight CursorLine guibg=#434C5E]]

    -- Headlines setup
    require('headlines').setup {
      markdown = {
        headline_highlights = {
          'Headline1',
          'Headline2',
          'Headline3',
          'Headline4',
          'Headline5',
          'Headline6',
        },
        codeblock_highlight = 'CodeBlock',
        dash_highlight = 'Dash',
        quote_highlight = 'Quote',
      },
    }

    -- Toggle background transparency
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.nord_disable_background = bg_transparent
      vim.cmd [[colorscheme nord]]
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
