# Python Setup for Neovim (LSP, Formatting, Static Typing)

This setup provides:

- Global Neovim Python provider
- Per-project virtualenv detection for LSP
- `pylsp-mypy` for static typing
- `black` for formatting
- `ruff` for linting and import sorting

---

## 1. Create the Neovim Python environment

```bash
python3 -m venv ~/.local/nvim-python
source ~/.local/nvim-python/bin/activate
pip install pynvim python-lsp-server pylsp-mypy black ruff
```

Add this to your Neovim config (e.g. `init.lua`):

```lua
vim.g.python3_host_prog = "~/.local/nvim-python/bin/python"
```

---

## 2. Per-project venv detection for pylsp

Neovim automatically detects local virtual environments named:

- `venv/`
- `.venv/`
- `env/`

Your `lsp.lua` includes a helper similar to:

```lua
local function get_python_path(workspace)
  for _, pattern in ipairs { 'venv', '.venv', 'env' } do
    local python = workspace .. '/' .. pattern .. '/bin/python'
    if vim.fn.executable(python) == 1 then
      return python
    end
  end
  return vim.fn.exepath('python3') or 'python3'
end
```

And the pylsp setup:

```lua
pylsp = {
  on_new_config = function(new_config, root_dir)
    new_config.cmd = { get_python_path(root_dir), '-m', 'pylsp' }
  end,
  settings = {
    pylsp = {
      plugins = {
        pyflakes = { enabled = false },
        pycodestyle = { enabled = false },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        mccabe = { enabled = false },
        pylsp_black = { enabled = false },
        pylsp_isort = { enabled = false },
        pylsp_mypy = {
          enabled = true,
          live_mode = true,
        },
      },
    },
  },
}
```

This ensures:

- project-specific packages (e.g. `pandas`, `django`, `fastapi`) are visible to the LSP  
- mypy uses the correct environment  
- you do not need global installs for project dependencies

---

## 3. Recommended project workflow

For each new Python project:

```bash
python3 -m venv venv
source venv/bin/activate
pip install -U pip
pip install pandas black ruff mypy
```

Then open the folder in Neovim:

```bash
nvim .
```

The LSP will automatically pick up `./venv` and use it for analysis.
