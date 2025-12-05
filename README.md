<p align="center">
  <img src="https://raw.githubusercontent.com/github/explore/main/topics/neovim/neovim.png" width="110" alt="Neovim Logo"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.9%2B-57A143?logo=neovim" />
  <img src="https://img.shields.io/badge/Lua-Configured-blue?logo=lua" />
  <img src="https://img.shields.io/badge/LSP-Enabled-green" />
  <img src="https://img.shields.io/badge/Linux-Ready-orange?logo=linux" />
</p>

# 🌿 Personal Neovim Configuration

A fast, modern, fully‑typed developer setup built around:

- **lazy.nvim** plugin manager  
- **Treesitter**  
- **LSP + auto‑formatting + diagnostics**  
- **Ruff + Mypy + Black** for Python  
- **TypeScript & Lua** high‑quality support  
- **Neo-tree, Telescope, Gitsigns**  
- **Automatic Python venv detection**

This repo is meant as a *clean, structured, extensible* Neovim configuration for daily professional development.

---

## 📚 Table of Contents
- [✨ Features](#-features)
- [🚀 Getting Started](#-getting-started)
- [📦 Installation](#-installation)
- [🧩 Dependencies](#-dependencies)
- [🐍 Python Support Overview](#-python-support-overview)
- [🔧 Keymaps Overview](#-keymaps-overview)
- [🧠 LSP Overview](#-lsp-overview)
- [📖 Full Documentation](#-full-documentation)

---

## ✨ Features

### 🧠 LSP & Autocomplete
- Per‑project Python venv selection  
- Mypy type checking  
- Ruff linting + import sorting  
- Black / Prettier / Stylua formatters  
- Lua LS (with Debian `libbfd` fix)

### 🔍 Search & Navigation
- Telescope pickers (files, live grep, buffers, diagnostics, symbols)
- Neo‑tree file explorer
- Smart folding, motion, and keymap consistency

### 🌈 UI & UX
- Nerd Font support  
- Treesitter highlighting  
- Inline diagnostics  
- Status column icons  
- Gitsigns with hunk staging & preview

---

## 🚀 Getting Started

### 1. Backup your config
```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

### 2. Clone this configuration
```bash
git clone https://github.com/tysker/neovim_my_personal_setup.git ~/.config/nvim
```

### 3. Launch Neovim
```bash
nvim
```

lazy.nvim will install all plugins automatically on first launch.

---

## 📦 Installation

You can install the full dependency stack using:

👉 `docs/dependencies.md`

After installing system dependencies, reload Neovim:

```bash
nvim
```

---

## 🧩 Dependencies

System tools, Nerd Fonts, Node.js, and Python provider setup →  
👉 `docs/dependencies.md`

---

## 🐍 Python Support Overview

This config provides a complete Python environment:

- `pylsp` as language server  
- `pylsp-mypy` for static typing  
- Ruff for linting & isort  
- Black for code formatting  
- Per‑project **venv detection**  
- Correct interpreter passed through LSP dynamically  

Full instructions in →  
👉 `docs/python-setup.md`

---

## 🔧 Keymaps Overview

A fully synced keymap reference lives here:

👉 `docs/keymaps.md`

---

## 🧠 LSP Overview

The LSP system includes:

- TypeScript (`ts_ls`)
- Python (`pylsp`)
- Ruff (linting)
- HTML / CSS / Tailwind
- Docker
- Terraform
- JSON / YAML
- SQL
- Lua LS (configured with runtime library)

Additional troubleshooting →  
👉 `docs/troubleshooting.md`  
Libbfd fix for Debian/Ubuntu →  
👉 `docs/lua-ls-fix.md`

---

## 📖 Full Documentation

| Topic | File |
|-------|------|
| Python Setup | docs/python-setup.md |
| Lua LS Fix | docs/lua-ls-fix.md |
| System Dependencies | docs/dependencies.md |
| Keymaps | docs/keymaps.md |
| LSP Overview | docs/lsp.md |
| Troubleshooting | docs/troubleshooting.md |
| Screenshots | docs/screenshots.md |

---

# Enjoy your fully modern Neovim setup!
