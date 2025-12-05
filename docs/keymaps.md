# Neovim Keymaps Overview

This is a high-level overview of common keymaps.  
Adjust to match your actual `keymaps.lua` content.

---

## General

- `<leader>e` — Toggle Neo-tree file explorer  
- `<leader>ff` — Telescope: find files  
- `<leader>fg` — Telescope: live grep  
- `<leader>fb` — Telescope: buffers  
- `<leader>fh` — Telescope: help tags  

---

## LSP

- `gd` — Go to definition  
- `gr` — Go to references  
- `gI` — Go to implementation  
- `<leader>D` — Type definition  
- `<leader>ds` — Document symbols  
- `<leader>ws` — Workspace symbols  
- `<leader>rn` — Rename symbol  
- `<leader>ca` — Code action (normal + visual mode)  
- `gD` — Go to declaration  

---

## Diagnostics

- `<leader>xx` — Toggle diagnostics (depending on your diagnostics plugin)  
- `[d` / `]d` — Previous/next diagnostic  

You can extend this file with a full table if you want a complete reference.
