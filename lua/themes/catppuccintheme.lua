return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,

  config = function()
    -- Wrapper function so we can reuse setup
    local function setup_catppuccin(is_light)
      require('catppuccin').setup {
        flavour = 'auto',
        background = is_light and {
          light = 'latte',
          dark = 'latte',
        } or {
          light = 'mocha',
          dark = 'mocha',
        },
        transparent_background = false,
        float = {
          transparent = false,
          solid = false,
        },
      }

      vim.cmd.colorscheme 'catppuccin'

      -- Cursorline: differentiate latte and mocha automatically
      if is_light then
        -- LATTE
        vim.cmd [[highlight CursorLine guibg=#e6e9ef]]
      else
        -- MOCHA
        vim.cmd [[highlight CursorLine guibg=#313244]]
      end
    end

    -- Initial (mocha)
    local is_light = false
    setup_catppuccin(is_light)

    -- Toggle latte <-> mocha
    local function toggle_theme()
      is_light = not is_light
      setup_catppuccin(is_light)
    end

    vim.keymap.set('n', '<leader>bg', toggle_theme, { noremap = true, silent = true })
  end,
}
