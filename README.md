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
- Architecture Overview
- Getting Started
- Installation
- Dependencies
- Formatting
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

## 🧱 Neovim Architecture

This configuration is structured into **clear, single-purpose layers**.
Each layer answers one question and avoids overlapping responsibilities.

The result:

- predictable formatting
- consistent diagnostics
- easy debugging
- simple extension over time

---

### High-level responsibilities

| Layer                    | Responsibility                           |
| ------------------------ | ---------------------------------------- |
| **Conform**              | Format on save                           |
| **LSP (lspconfig)**      | Language intelligence + core diagnostics |
| **none-ls**              | Extra diagnostics only                   |
| **Mason**                | Installing tools                         |
| **mason-tool-installer** | Enforcing required tools                 |
| **Tree-sitter**          | Syntax parsing & highlighting            |

---

```
┌─────────────┐
│ Tree-sitter │ → syntax, highlighting, indent
└──────┬──────┘
       │
┌──────▼──────┐
│     LSP     │ → meaning, diagnostics, navigation
└──────┬──────┘
       │
┌──────▼──────┐
│   Conform   │ → formatting on save
└──────┬──────┘
       │
┌──────▼──────┐
│   none-ls   │ → extra diagnostics (linters)
└──────┬──────┘
       │
┌──────▼──────┐
│    Mason    │ → installs all external tools
└─────────────┘
```

---

### What `ensure_installed` means (important)

Multiple plugins use `ensure_installed`, but they install **different things**.

| Layer           | Installs…         | Purpose                            |
| --------------- | ----------------- | ---------------------------------- |
| **Tree-sitter** | Grammar parsers   | Highlighting, indentation, folding |
| **Mason**       | External binaries | LSPs, formatters, linters          |
| **Conform**     | Nothing           | Uses installed formatters          |
| **none-ls**     | Nothing           | Uses installed linters             |

Having multiple `ensure_installed` blocks is **expected and correct**.

---

### Mental model

- **Tree-sitter** → _“How do I read this file?”_
- **LSP** → _“What does this code mean?”_
- **Conform** → _“How should this code look?”_
- **none-ls** → _“Is this code sane?”_
- **Mason** → _“Do I have the tools?”_

Each layer does **one job only**.  
That’s what keeps the configuration stable.

### How the layers interact

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
| OpenSCAD            | docs/openscad.md        |
