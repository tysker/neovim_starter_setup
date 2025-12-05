# Troubleshooting Guide

Some common issues and quick fixes.

---

## 1. `lua_ls` exits with code 127 or `.so` errors

Symptom:

```text
lua_ls quit with exit code 127
error while loading shared libraries: libbfd-2.38-system.so
```

Fix: see detailed instructions in:  
👉 [lua-ls-fix.md](lua-ls-fix.md)

---

## 2. Python LSP does not see project packages

Symptom:

- Autocomplete does not work for `pandas`, `django`, etc.
- Diagnostics show `ModuleNotFoundError` even though the package is installed in the project.

Causes:

- The LSP is using the wrong Python interpreter (not your project venv).

Fix:

- Make sure your `lsp.lua` uses the `get_python_path` helper.
- Ensure your project has a `venv/`, `.venv/`, or `env/` folder.
- Re-open Neovim in the project root:

```bash
cd /path/to/project
nvim .
```

---

## 3. Mason packages fail or get corrupted

If a language server fails to install or behaves strangely:

```bash
rm -rf ~/.local/share/nvim/mason
nvim
```

Mason will reinstall everything when Neovim starts. This often fixes partial or corrupted installs.

---

## 4. Python provider issues in `:checkhealth`

If `:checkhealth` shows warnings for the Python 3 provider:

- Ensure the Neovim Python environment exists:

```bash
python3 -m venv ~/.local/nvim-python
source ~/.local/nvim-python/bin/activate
pip install pynvim
```

- Ensure this line is set:

```lua
vim.g.python3_host_prog = "~/.local/nvim-python/bin/python"
```

Re-run:

```vim
:checkhealth
```
