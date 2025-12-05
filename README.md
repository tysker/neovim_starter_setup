<p align="center">
  <img src="https://raw.githubusercontent.com/github/explore/main/topics/neovim/neovim.png" width="110" alt="Neovim logo" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.9%2B-57A143?logo=neovim&logoColor=white" />
  <img src="https://img.shields.io/badge/Made%20with-Lua-blue?logo=lua&logoColor=white" />
  <img src="https://img.shields.io/badge/LSP-Enabled-green" />
  <img src="https://img.shields.io/badge/Linux-Ready-orange?logo=linux&logoColor=white" />
  <img src="https://img.shields.io/github/stars/tysker/neovim_my_personal_setup?style=social" />
</p>

# 🌿 Neovim Configuration

A clean, fast, modular Neovim setup powered by **lazy.nvim**, Treesitter, LSP, Telescope, and a structured Lua configuration.

Optimized for:

- Web development (TypeScript, JavaScript, HTML/CSS, Tailwind)
- Python (with full static typing + formatting)
- Lua and general software engineering workflows

---

## 📚 Table of Contents

- [✨ Features](#-features)
- [🚀 Getting Started](#-getting-started)
- [📦 Installation](#-installation)
- [🧩 Dependencies](#-dependencies)
- [🐍 Python Support](#-python-support)
- [📖 Documentation](#-documentation)
- [🖼 Screenshots](#-screenshots)

---

## ✨ Features

- ⚡ Fast startup with lazy-loaded plugins  
- 🧠 Treesitter syntax and structure parsing  
- 🧩 Full LSP support (TypeScript, Lua, Python, etc.)  
- ✍️ Autocompletion with nvim-cmp  
- 🔍 Telescope fuzzy searching  
- 📁 Neo-tree file explorer  
- 🌈 Themed UI with Nerd Font support  
- 🧵 Git integration and status signs  
- 🐍 Python typing support via `pylsp-mypy`  
- 🧹 Formatting via Black, Prettier, Stylua, etc.  

---

## 🚀 Getting Started

### 1. Backup your existing config

```bash
mv ~/.config/nvim ~/.config/nvim_backup
```

### 2. Clone this configuration

```bash
git clone https://github.com/tysker/neovim_my_personal_setup.git ~/.config/nvim
```

### 3. Start Neovim

```bash
nvim
```

The plugin manager **lazy.nvim** will automatically install and set up all plugins.

### 4. (Optional) Configure Python support

If you use Python regularly, finish the setup in:  
👉 [docs/python-setup.md](docs/python-setup.md)

---

## 📦 Installation

If you already use Neovim daily and just want the short version, this is all you need:

```bash
mv ~/.config/nvim ~/.config/nvim_backup
git clone https://github.com/tysker/neovim_my_personal_setup.git ~/.config/nvim
nvim
```

For full OS-level requirements, see:  
👉 [docs/dependencies.md](docs/dependencies.md)

---

## 🧩 Dependencies

Basic system tools, Node.js, and fonts are described in detail in:  
👉 [docs/dependencies.md](docs/dependencies.md)

You will find:

- Recommended `apt` packages (ripgrep, fd-find, build tools, etc.)
- Node.js setup via `nvm`
- Nerd Font recommendation and `vim.g.have_nerd_font` usage

---

## 🐍 Python Support

This configuration is designed for a strong Python experience:

- Global Neovim Python host in `~/.local/nvim-python`
- Per-project virtualenv detection for LSP (`venv`, `.venv`, `env`)
- `python-lsp-server` as the main LSP
- `pylsp-mypy` for static typing
- `black` for formatting
- `ruff` for linting and import sorting

All details and commands are captured in:  
👉 [docs/python-setup.md](docs/python-setup.md)

---

## 📖 Documentation

Additional documentation is located in the **docs/** folder:

| Topic                      | File                                             |
|----------------------------|--------------------------------------------------|
| Python LSP Provider Setup  | [docs/python-setup.md](docs/python-setup.md)     |
| Lua LS `.so` Fix (libbfd)  | [docs/lua-ls-fix.md](docs/lua-ls-fix.md)         |
| System Dependencies        | [docs/dependencies.md](docs/dependencies.md)     |
| Keymaps Overview           | [docs/keymaps.md](docs/keymaps.md)               |
| Troubleshooting            | [docs/troubleshooting.md](docs/troubleshooting.md) |
| Screenshots                | [docs/screenshots.md](docs/screenshots.md)       |

---

## 🖼 Screenshots

Preview screenshots and the full gallery are available here:  
👉 [docs/screenshots.md](docs/screenshots.md)
