# 🧩 System Dependencies

Recommended for Debian/Ubuntu‑based systems.

---

# 1. Core Tools

```bash
sudo apt update
sudo apt install -y git gcc build-essential ripgrep fd-find unzip xclip curl
```

Alias fd-find:

```bash
echo 'alias fd=fdfind' >> ~/.zshrc
```

---

# 2. Node.js (for many LSPs)

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 22
npm install -g neovim
```

---

# 3. Fonts

Install a Nerd Font (JetBrainsMono recommended).  
Terminal → set font to *JetBrainsMono Nerd Font*.

Enable in config:

```lua
vim.g.have_nerd_font = true
```

