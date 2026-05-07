-- lua/themes/selector.lua

local themes = require '../plugins/theme-selection'
local last_theme_file = vim.fn.stdpath 'data' .. '/last_theme.txt'

-- Function to read the last used theme from a file
local function get_last_theme()
  local file = io.open(last_theme_file, 'r')
  if file then
    local last_theme = file:read '*a'
    file:close()
    return last_theme:gsub('^%s*(.-)%s*$', '%1') -- Trim whitespace
  end
  return 'catppuccin-dark' -- Default theme
end

-- Function to save the current theme to a file
local function save_last_theme(theme_name)
  local file = io.open(last_theme_file, 'w')
  if file then
    file:write(theme_name)
    file:close()
  end
end

-- Function to apply a theme
local function apply_theme(theme_name)
  local theme = themes.themes[theme_name]
  if theme then
    vim.cmd('colorscheme ' .. theme.name)
    theme.config()
    save_last_theme(theme_name) -- Save the current theme
  end
end

-- Function to select a theme using Telescope
local function select_theme()
  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Select Theme',
      finder = require('telescope.finders').new_table {
        results = vim.tbl_keys(themes.themes),
      },
      sorter = require('telescope.config').values.generic_sorter {},
      attach_mappings = function(prompt_bufnr, map)
        local set_theme = function()
          local selection = require('telescope.actions.state').get_selected_entry()
          apply_theme(selection[1])
          require('telescope.actions').close(prompt_bufnr)
        end
        map('i', '<CR>', set_theme)
        map('n', '<CR>', set_theme)
        return true
      end,
    })
    :find()
end

-- Initialize the last used theme
local last_theme = get_last_theme()
apply_theme(last_theme)

-- Keybinding to open theme selector
vim.keymap.set('n', '<leader>ct', select_theme, { desc = 'Choose theme' })
