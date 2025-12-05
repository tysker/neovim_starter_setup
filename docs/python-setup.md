# 🐍 Python Setup for Neovim

This configuration provides a complete, fully typed Python development workflow.

---

# 1. Create the Neovim Python Provider (Global)

```bash
python3 -m venv ~/.local/nvim-python
source ~/.local/nvim-python/bin/activate
pip install pynvim python-lsp-server pylsp-mypy ruff black
```

Add this to `init.lua`:

```lua
vim.g.python3_host_prog = "~/.local/nvim-python/bin/python"
```

---

# 2. Per‑project Virtual Environment Detection

Your `lsp.lua` includes:

```lua
local function get_python_path(workspace)
  for _, pattern in ipairs { "venv", ".venv", "env" } do
    local python = workspace .. "/" .. pattern .. "/bin/python"
    if vim.fn.executable(python) == 1 then
      return python
    end
  end
  return vim.fn.exepath("python3") or "python3"
end
```

This ensures:

- Autocomplete sees project-installed packages  
- Mypy uses correct stubs  
- Ruff respects local configs  
- No need to install libraries globally  

---

# 3. pylsp Configuration

From your actual config:

```lua
pylsp = {
  on_new_config = function(new_config, root_dir)
    new_config.cmd = { get_python_path(root_dir), "-m", "pylsp" }
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
        pylsp_mypy = { enabled = true, live_mode = true }
      }
    }
  }
}
```

---

# 4. Project Setup Example

```bash
python3 -m venv venv
source venv/bin/activate
pip install pandas requests ruff mypy black
```

Open the project:

```bash
nvim .
```

pylsp will automatically use `./venv/bin/python`.

