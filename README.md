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

A fast, modern, fully-typed developer setup built around:

- **lazy.nvim** plugin manager
- **Treesitter**
- **LSP + auto-formatting + diagnostics**
- **Ruff + Pyright + Black** for Python
- **TypeScript & Lua** high-quality support
- **Neo-tree, Telescope, Gitsigns**
- **Automatic Python venv detection**

This repo is meant as a clean, structured, extensible Neovim configuration for daily professional development.

---

## 📚 Table of Contents

- Features
- Getting Started
- Installation
- Dependencies
- Python Support Overview
- Keymaps Overview
- LSP Overview
- Full Documentation

---

## ✨ Features

### 🧠 LSP & Autocomplete

- Pyright for Python
- Ruff for linting and isort
- Black for formatting
- Automatic virtualenv selection
- Lua LS, TypeScript, SQL, JSON, YAML, Docker, Terraform
- Per-project settings respected automatically

### 🔍 Search & Navigation

- Telescope pickers (files, live grep, buffers, diagnostics, symbols)
- Neo-tree file explorer
- Smart motions and folds

### 🌈 UI & UX

- Nerd Font support
- Treesitter highlighting
- Inline diagnostics
- Status column icons
- Gitsigns for hunk navigation and staging

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

lazy.nvim will install all plugins on first launch.

---

## 📦 Installation

Install system dependencies →  
`docs/dependencies.md`

Then launch Neovim.

---

## 🧩 Dependencies

Includes:

- System packages
- Nerd Fonts
- Node.js
- Global Neovim Python provider

See → `docs/dependencies.md`

---

## 🐍 Python Support Overview

This configuration includes a **modern Python toolchain**:

- **Pyright** – language intelligence + type checking
- **Ruff** – linting + import organization
- **Black** – formatting
- **Automatic venv detection** (`./venv`, `./.venv`)
- Everything runs in your _project’s_ environment

Full docs → `docs/python-setup.md`

---

## 🔧 Keymaps Overview

See → `docs/keymaps.md`

---

## 🧠 LSP Overview

Language servers included:

- Python (Pyright + Ruff)
- TypeScript / JavaScript
- Lua LS
- Terraform
- Docker
- JSON / YAML
- SQL
- HTML / CSS / Tailwind

More info → `docs/lsp.md`

---

## 📖 Full Documentation

| Topic               | File                    |
| ------------------- | ----------------------- |
| Python Setup        | docs/python-setup.md    |
| Lua LS Fix          | docs/lua-ls-fix.md      |
| System Dependencies | docs/dependencies.md    |
| Keymaps             | docs/keymaps.md         |
| LSP Overview        | docs/lsp.md             |
| Troubleshooting     | docs/troubleshooting.md |
| Screenshots         | docs/screenshots.md     |
