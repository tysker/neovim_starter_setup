# 🧼 Formatting (Conform + OpenSCAD)

This configuration uses **conform.nvim** for formatting.

- **Format on save** is enabled via Conform.
- Conform uses **external formatters** when configured (e.g. `stylua`, `black`).
- If no external formatter is configured for a filetype, Conform falls back to **LSP formatting**.

---

## How formatting works in this config

### Format on save

Enabled in `lua/plugins/conform.lua`:

- `format_on_save.lsp_format = "fallback"`  
  → Use external formatter when available, otherwise use LSP (`vim.lsp.buf.format()`).

### Manual formatting

You can always format the current buffer manually:

```vim
:lua require("conform").format({ async = false })
```

(You can also use `:ConformInfo` to see which formatter will run.)

---

## OpenSCAD formatting

### Default: format via LSP

For `*.scad`, formatting is done via **openscad_lsp** (LSP fallback).

This is why `:ConformInfo` shows:

- `LSP: openscad_lsp`

No extra formatter installation is required beyond having the LSP working.

### Optional: use `openscad-format` (external formatter)

If you prefer an external formatter, you can install:

```bash
npm install -g openscad-format
```

`openscad-format` requires `clang-format` (Debian/Ubuntu):

```bash
sudo apt install clang-format
```

Then extend `lua/plugins/conform.lua`:

```lua
formatters_by_ft = {
  openscad = { "openscad_format" },
  -- ...
},

formatters = {
  openscad_format = {
    command = "openscad-format",
    stdin = true, -- reads stdin by default when piped
  },
},
```

If `openscad-format` returns **empty output** in your setup, Conform will abort the format.
In that case, prefer LSP formatting or use the wrapper approach described in `docs/troubleshooting.md`.

---

## Common checks

- Confirm filetype:

```vim
:set ft?
```

Expected: `filetype=openscad`

- Confirm Conform is loaded and sees the formatter/LSP:

```vim
:ConformInfo
```
