# 🩹 Lua Language Server Fix (Debian / Ubuntu)

If you see:

```
lua_ls exit code 127
error while loading shared libraries: libbfd-2.38-system.so
```

Your system provides:

```
libbfd-2.42-system.so
```

Lua LS expects an older version.

---

# ✅ Fix

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/libbfd-2.42-system.so            /usr/lib/x86_64-linux-gnu/libbfd-2.38-system.so
```

Test:

```bash
~/.local/share/nvim/mason/packages/lua-language-server/lua-language-server --version
```

If it prints a version, the server works.

