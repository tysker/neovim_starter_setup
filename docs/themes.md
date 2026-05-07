# 🎨 Theme System

This configuration includes a dynamic theme selector with session persistence.  
Themes are managed in `lua/plugins/theme-selection.lua` and `lua/themes/selector.lua`.

---

## Switching Themes

Press `<leader>ct` in normal mode to open the Telescope theme picker.  
Select a theme and press `<CR>` to apply it immediately.

The selected theme is saved automatically and restored on the next Neovim launch.

---

## Available Themes

| Key                | Name             | Style |
| ------------------ | ---------------- | ----- |
| `catppuccin-dark`  | Catppuccin Mocha | Dark  |
| `catppuccin-light` | Catppuccin Latte | Light |
| `nord`             | Nord             | Dark  |
| `fluoromachine`    | Fluoromachine    | Dark  |
| `gruvbox-dark`     | Gruvbox          | Dark  |
| `gruvbox-light`    | Gruvbox          | Light |

Default theme on first launch: `catppuccin-dark`

---

## Adding a New Theme

1. Install the plugin in `lua/themes/` — create a new file, e.g. `lua/themes/tokyonight.lua`:

```lua
return {
  'folke/tokyonight.nvim',
  lazy = true,
}
```

2. Register it in `lua/plugins/theme-selection.lua` under `M.themes`:

```lua
['tokyonight'] = {
  name = 'tokyonight',
  plugin = 'folke/tokyonight.nvim',
  config = function()
    vim.cmd.colorscheme 'tokyonight'
  end,
},
```

3. Load the plugin file in `init.lua` under the Themes section:

```lua
require 'themes.tokyonight',
```

The new theme will appear automatically in the `<leader>ct` picker.

---

## How Persistence Works

The active theme name is written to a plain text file at:

```
~/.local/share/nvim/last_theme.txt
```

On startup, `lua/themes/selector.lua` reads this file and applies the saved theme before any UI is rendered.
