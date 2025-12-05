# System Dependencies for This Neovim Setup

These are example dependencies for a typical Debian/Ubuntu-based setup.
Adapt as needed for your system.

---

## Core packages

```bash
sudo apt update
sudo apt install -y git build-essential ripgrep fd-find unzip xclip curl
```

- `ripgrep` and `fd-find` are used by Telescope and other file-finder integrations.
- `xclip` enables system clipboard integration on X11.

On some distributions, `fd-find` installs as `fdfind`. You can alias it:

```bash
echo 'alias fd=fdfind' >> ~/.bashrc
# or ~/.zshrc depending on your shell
```

---

## Node.js (for LSPs and formatters)

This configuration assumes Node is installed via `nvm`:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 22
nvm alias default 22
npm install -g neovim
```

---

## Fonts (Nerd Font)

Install a Nerd Font, such as JetBrainsMono Nerd Font, and configure your terminal to use it.

In Neovim, you can hint that Nerd Font icons are available:

```lua
vim.g.have_nerd_font = true
```

This is used by some plugins to enable richer icon sets.
