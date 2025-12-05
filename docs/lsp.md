# 🧠 LSP Overview

The configuration enables multiple language servers via mason + nvim-lspconfig.

---

## Enabled Language Servers

| Language | Server |
|---------|---------|
| TypeScript | ts_ls |
| Python | pylsp (+ mypy plugin) |
| Python linting | ruff |
| HTML | html |
| CSS | cssls |
| Tailwind | tailwindcss |
| Docker | dockerls |
| SQL | sqlls |
| Terraform | terraformls |
| JSON | jsonls |
| YAML | yamlls |
| Lua | lua_ls |

---

## Python LSP Highlights

- Project venv detection  
- pylsp-mypy enabled  
- All formatting plugins disabled (Black handles formatting)  
- Ruff handles linting  

---

## Lua LS Highlights

- Runtime set to LuaJIT  
- Neovim runtime paths included  
- Diagnostics tuned (`vim` global allowed)  
- Format disabled (Stylua used instead)  
- Includes Debian libbfd fix (see docs/lua-ls-fix.md)

---

## Telescope Integration

All navigation commands automatically use Telescope:

- Definitions  
- References  
- Implementations  
- Document/Workspace symbols  

---

## Inlay Hints
Toggle:

```
<leader>th
```
