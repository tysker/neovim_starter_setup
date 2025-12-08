# 🐍 Python Setup for Neovim

This Neovim configuration provides a **modern, fast, project-isolated** Python development environment built on:

- **Pyright** — type checking, autocomplete, navigation  
- **Ruff** — linting + import sorting  
- **Black** — opinionated formatting  
- **Automatic virtual environment detection**  
- **Zero global pollution** (all tools run inside the project venv)

This file explains how everything works and how to set it up.

---

## 1. Global Python Provider for Neovim

Neovim needs a Python interpreter for internal plugins.  
This environment does **not** affect the LSP or project dependencies.

```bash
python3 -m venv ~/.local/nvim-python
source ~/.local/nvim-python/bin/activate
pip install pynvim
```

Add to `init.lua`:

```lua
vim.g.python3_host_prog = "~/.local/nvim-python/bin/python"
```

---

## 2. Automatic Per-Project Virtualenv Detection

The `lsp.lua` includes logic that detects a Python interpreter in the project:

```lua
local function get_python_path(workspace)
  for _, pattern in ipairs { 'venv', '.venv' } do
    local python = workspace .. '/' .. pattern .. '/bin/python'
    if vim.fn.executable(python) == 1 then
      return python
    end
  end
  return 'python3'
end
```

This ensures:

- Pyright uses your project’s interpreter  
- Ruff respects your project configuration  
- No need to install libraries globally  
- Every project stays isolated  

---

## 3. Pyright Configuration (LSP)

The Neovim setup starts **Pyright** with the correct interpreter:

```lua
pyright = {
  cmd = { get_python_path(vim.fn.getcwd()), '-m', 'pyright' },
  settings = {
    python = {
      pythonPath = get_python_path(vim.fn.getcwd()),
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'workspace',
        typeCheckingMode = 'basic',
      },
    },
  },
}
```

Pyright provides:

- Type checking  
- IntelliSense / autocomplete  
- Jump-to-definition  
- Hover documentation  
- Workspace-aware analysis  

---

## 4. Ruff LSP

Ruff runs as a separate LSP server:

```lua
ruff = {}
```

Ruff gives:

- Fast linting  
- Import sorting (isort-compatible)  
- Quick fixes  
- Code actions for common issues  

---

## 5. Black Formatting

Installed through Mason as:

```
black
```

Formatting can be triggered via:

```
:Format
```

Or `Ctrl-s`

---

## 6. Recommended Project Setup

Inside each Python project:

```bash
python3 -m venv venv
source venv/bin/activate
pip install pyright ruff black
```

Then open the project:

```bash
nvim .
```

Neovim will automatically:

- Detect `./venv/bin/python`  
- Start Pyright with correct interpreter  
- Launch Ruff for linting  
- Format via Black  

Everything remains clean and project-local.

---

## 7. Summary

The Python stack looks like this:

| Component | Tool | Purpose |
|----------|------|---------|
| LSP | **Pyright** | Types, autocomplete, navigation |
| Linting | **Ruff** | Lint + import sorting |
| Formatting | **Black** | Code formatting |
| Env detection | Custom `get_python_path` | Always use correct venv |

