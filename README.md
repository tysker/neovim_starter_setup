<p align="center">
  <img src="https://raw.githubusercontent.com/github/explore/main/topics/neovim/neovim.png" width="120" alt="Neovim Logo"/>
</p>

<h1 align="center">My Neovim Configuration</h1>

<p align="center">
  <strong>Fast · Modular · Lazy.nvim · LSP · Treesitter · Developer-Ready</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-0.9+-57A143?logo=neovim&logoColor=white" />
  <img src="https://img.shields.io/badge/Lua-5.1%2B-blue?logo=lua&logoColor=white" />
  <img src="https://img.shields.io/badge/Status-Active-blue" />
  <img src="https://img.shields.io/badge/License-MIT-green" />
</p>

---

# 🌟 Neovim Configuration (Lazy.nvim + Lua)

A fast, structured, developer-friendly Neovim setup built with **lazy.nvim**, Lua, Treesitter, LSP, Telescope, and a clean modular plugin layout.
Optimized for **web development (React/TypeScript)** and **general productivity**.

This configuration is easy to install, easy to extend, and includes an extensive keymap reference for quick onboarding.

---

| Dark Theme                                                               | Light Theme                                                |
| ------------------------------------------------------------------------ | ---------------------------------------------------------- |
| <img src="/images/cattpuccin_theme_dark.png" align="center" width="50%"> | <img src="/images/cattpuccin_theme_light.png" width="50%"> |

---

## 📦 Features

- ⚡ **Fast startup** thanks to lazy-loaded plugins
- 🧭 **Neo-tree** for file navigation
- 🔍 **Telescope** for fuzzy search, buffers, diagnostics, and more
- 🧠 **LSP-ready** (TypeScript, Java, Lua, etc.)
- 🎨 Clean theme, transparency toggle, UI improvements
- 🧩 **Treesitter** for syntax, folding, and better parsing
- ✂️ **nvim-cmp** autocompletion with LuaSnip
- 🪝 **Git integration** with Gitsigns
- 🪢 Intuitive, well-structured **keymaps**
- 📁 Modular Lua plugin structure
- 🔧 Includes formatter integration, auto-commands, and quality-of-life settings

---

## 🔧 External Dependencies

This configuration requires a few external tools depending on what languages you want to work with.

### Core Tools

- `git`
- `make`
- `unzip`
- C compiler (`gcc` or `clang`)
- Clipboard tool:
  - Linux: `xclip` or `xsel`
  - Windows: `win32yank.exe`
  - WSL: `clip.exe`

### Recommended Search Tools

- `ripgrep` (required by Telescope)
- `fd` / `fdfind`
- `Node.js / npm`
- `Python`

### Fonts

- **Nerd Font** (for icons)  
  If installed, set:
  ```lua
  vim.g.have_nerd_font = true
  ```

Inside the themes folder, you will find two themes. The cattpuccin is selected as default. You can always toggle the theme by uncomment the require field inside init.lua and vice versa.
When using the cattpuccin theme, it is possible to switch from mocca to light by usingthe <leader>bg keys.

---

## 📥 Installation

### **1. Backup your existing config**

```
mv ~/.config/nvim ~/.config/nvim_backup
```

### **2. Clone this repository**

```
git clone https://github.com/tysker/neovim_my_personal_setup.git ~/.config/nvim
```

### **3. Install recommended packages**

If you're on Debian/Ubuntu:

```
sudo apt update
sudo apt install -y python3 python3-pip python3-venv build-essential
sudo python3 -m pip install --user pynvim
export PATH="$HOME/.local/bin:$PATH"
sudo apt install curl grep ripgrep fd-find
```

Node.js

```
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24

# Verify the Node.js version:
node -v # Should print "v24.11.1".

# Verify npm version:
npm -v # Should print "11.6.2".
```

```
npm install -g neovim
```

Neovim

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

### **4. Open Neovim**

```
nvim
```

lazy.nvim will automatically install all plugins.

---

## 🗂️ Folder Structure

```
~/.config/nvim
├── images
│   ├── cattpuccin_theme_dark.png
│   ├── cattpuccin_theme_light.png
│   ├── nordtheme.png
│   ├── nvim_pic_01.png
│   ├── nvim_pic_02.png
│   └── nvim_pic_03.png
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── keymaps.lua
│   │   ├── options.lua
│   │   └── snippets.lua
│   ├── plugins
│   │   ├── alpha.lua
│   │   ├── autocompletion.lua
│   │   ├── autoformatting.lua
│   │   ├── bufferline.lua
│   │   ├── comment.lua
│   │   ├── gitsigns.lua
│   │   ├── indent-blankline.lua
│   │   ├── lsp.lua
│   │   ├── lualine.lua
│   │   ├── mischellaneous.lua
│   │   ├── neotree.lua
│   │   ├── rainbowbrackets.lua
│   │   ├── telescope.lua
│   │   └── treesitter.lua
│   └── themes
│       ├── catppuccintheme.lua
│       └── nordtheme.lua
└── README.md

```

---

## 🎮 Screenshots

### UI & File Explorer

<p align="center">
  <img src="/images/nvim_pic_01.png" width="50%" />
</p>

### Telescope Integration

<p align="center">
  <img src="/images/nvim_pic_02.png" width="50%" />
</p>

### Plugin Structure Overview

<p align="center">
  <img src="/images/nvim_pic_03.png" width="30%" />
</p>

---

## 🎹 Keymaps (Full Reference)

<details>
<summary><strong>Click to expand keymap reference</strong></summary>

# 📘 Neovim Keymap Reference

---

# 📑 Table of Contents

1. [Leader Keys](#leader-keys)
2. [File Actions](#file-actions)
3. [Editing Improvements](#editing-improvements)
4. [Window Management](#window-management)
5. [Buffers](#buffers)
6. [Tabs](#tabs)
7. [Line Wrapping](#toggle-line-wrapping)
8. [Diagnostics (LSP)](#diagnostics-lsp)
9. [Telescope](#telescope-search)
10. [Neo-tree](#neo-tree-file-explorer)
11. [Gitsigns](#git-signs)
12. [Completion (nvim-cmp)](#completion-nvim-cmp)
13. [Commenting](#commenting)
14. [Colorscheme](#colorscheme)
15. [LSP Actions](#lsp-actions)
16. [Treesitter](#treesitter)
17. [Snippets (LuaSnip)](#snippets-luasnip)

---

# Leader Keys

| Mapping         | Action             |
| --------------- | ------------------ |
| `<Space>`       | Leader key         |
| `<Space>` (n/v) | Disabled (`<Nop>`) |

---

# File Actions

| Mapping      | Action                  |
| ------------ | ----------------------- |
| `<C-s>`      | Save file               |
| `<leader>sn` | Save without formatting |
| `<C-q>`      | Quit                    |

---

# Editing Improvements

| Mapping      | Action                      |
| ------------ | --------------------------- |
| `x`          | Delete char without yanking |
| `<C-d>`      | Scroll down + center        |
| `<C-u>`      | Scroll up + center          |
| `n`          | Next search + center        |
| `N`          | Previous search + center    |
| `<` (visual) | Indent left                 |
| `>` (visual) | Indent right                |
| `p` (visual) | Paste without overwriting   |

---

# Window Management

## Splits

| Mapping      | Action           |
| ------------ | ---------------- |
| `<leader>v`  | Vertical split   |
| `<leader>h`  | Horizontal split |
| `<leader>se` | Equalize splits  |
| `<leader>xs` | Close split      |

## Resize

| Mapping | Action          |
| ------- | --------------- |
| `<M-a>` | Increase height |
| `<M-z>` | Decrease height |
| `<M-s>` | Decrease width  |
| `<M-x>` | Increase width  |

## Navigation

| Mapping | Action     |
| ------- | ---------- |
| `<C-k>` | Move up    |
| `<C-j>` | Move down  |
| `<C-h>` | Move left  |
| `<C-l>` | Move right |

---

# Buffers

| Mapping     | Action          |
| ----------- | --------------- |
| `<Tab>`     | Next buffer     |
| `<S-Tab>`   | Previous buffer |
| `<leader>x` | Delete buffer   |
| `<leader>b` | New buffer      |

---

# Tabs

| Mapping      | Action       |
| ------------ | ------------ |
| `<leader>to` | New tab      |
| `<leader>tx` | Close tab    |
| `<leader>tn` | Next tab     |
| `<leader>tp` | Previous tab |

---

# Toggle Line Wrapping

| Mapping      | Action          |
| ------------ | --------------- |
| `<leader>lw` | Toggle wrapping |

---

# Diagnostics (LSP)

| Mapping     | Action           |
| ----------- | ---------------- |
| `dn`        | Prev diagnostic  |
| `nd`        | Next diagnostic  |
| `<leader>d` | Diagnostic popup |
| `<leader>q` | Diagnostic list  |

---

# Telescope (Search)

<details>
<summary><strong>Click to expand</strong></summary>

| Mapping            | Action                   |
| ------------------ | ------------------------ |
| `<leader>sh`       | Search help              |
| `<leader>sk`       | Search keymaps           |
| `<leader>sf`       | Search files             |
| `<leader>ss`       | Telescope pickers        |
| `<leader>sw`       | Search word              |
| `<leader>sg`       | Live grep                |
| `<leader>sd`       | Search diagnostics       |
| `<leader>sr`       | Resume search            |
| `<leader>s.`       | Recent files             |
| `<leader><leader>` | Search open buffers      |
| `<leader>/`        | Search in current buffer |
| `<leader>s/`       | Grep open files only     |
| `<leader>sn`       | Search Neovim config     |

</details>

---

# Neo-tree (File Explorer)

| Mapping       | Action               |
| ------------- | -------------------- |
| `\`           | Reveal file          |
| `<leader>e`   | Toggle file explorer |
| `<leader>ngs` | Floating git status  |

---

# Git Signs

<details>
<summary><strong>Click to expand</strong></summary>

### Navigation

| Mapping | Action        |
| ------- | ------------- |
| `]c`    | Next hunk     |
| `[c`    | Previous hunk |

### Hunk Actions

| Mapping      | Action       |
| ------------ | ------------ |
| `<leader>hs` | Stage hunk   |
| `<leader>hu` | Undo stage   |
| `<leader>hr` | Reset hunk   |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Toggle blame |
| `<leader>hd` | Diff this    |
| `<leader>ht` | Toggle signs |

</details>

---

# Completion (nvim-cmp)

### Completion Navigation

| Mapping     | Action             |
| ----------- | ------------------ |
| `<C-n>`     | Next item          |
| `<C-p>`     | Previous item      |
| `<C-b>`     | Scroll docs up     |
| `<C-f>`     | Scroll docs down   |
| `<C-Space>` | Trigger completion |

### Accept

| Mapping | Action             |
| ------- | ------------------ |
| `<CR>`  | Confirm completion |

### Snippet Navigation

| Mapping   | Action        |
| --------- | ------------- |
| `<C-l>`   | Jump forward  |
| `<C-h>`   | Jump backward |
| `<Tab>`   | Next / expand |
| `<S-Tab>` | Previous      |

---

# Commenting

| Mapping     | Action         |
| ----------- | -------------- |
| `<C-_>`     | Toggle comment |
| `<C-c>`     | Toggle comment |
| `<C-/>`     | Toggle comment |
| `<C-_>` (v) | Visual comment |
| `<C-c>` (v) | Visual comment |
| `<C-/>` (v) | Visual comment |

---

# Colorscheme

| Mapping      | Action                |
| ------------ | --------------------- |
| `<leader>bg` | Toggle dark <-> light |

---

# LSP Actions

<details>
<summary><strong>Click to expand</strong></summary>

| Mapping      | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gD`         | Go to declaration    |
| `gI`         | Go to implementation |
| `gr`         | References           |
| `<leader>D`  | Type definition      |
| `<leader>ds` | Document symbols     |
| `<leader>ws` | Workspace symbols    |
| `<leader>rn` | Rename               |
| `<leader>ca` | Code action          |
| `<leader>th` | Toggle inlay hints   |

</details>

---

# Treesitter

Provides:

- Syntax highlighting
- Smart indentation
- Folding
- Better parsing
- Required by many plugins

No keymaps needed.

---

# Snippets (LuaSnip)

<details>
<summary><strong>Click to expand</strong></summary>

| Mapping   | Action        |
| --------- | ------------- |
| `<C-l>`   | Jump forward  |
| `<C-h>`   | Jump backward |
| `<Tab>`   | Expand / next |
| `<S-Tab>` | Previous      |

Supports **VSCode-style snippets** via `friendly-snippets`.

</details>

</details>

---

## 🌱 Inspiration

This config is heavily inspired by:

- [https://github.com/nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- [https://github.com/hendrikmi/neovim-kickstart-config](https://github.com/hendrikmi/neovim-kickstart-config)

Great starting points for anyone exploring their own setup.

---

## 📝 License

MIT — free to use, modify, and share.

---

## ⭐ Support & Sharing

If you find this useful, consider:

- starring the repo
- opening issues or suggestions
- sharing with others in the Neovim community

Your input helps shape this config further.

---
