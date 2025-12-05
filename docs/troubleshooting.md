# ❗ Troubleshooting

---

## Lua LS Exit Code 127
Cause: Missing libbfd.  
Fix: See docs/lua-ls-fix.md

---

## Python Modules Not Found in LSP
Cause: wrong interpreter.  
Fix: ensure project has venv; open project root.

---

## Mason Package Corruption
Fix:

```bash
rm -rf ~/.local/share/nvim/mason
nvim
```

