# Fix: Lua Language Server `.so` Load Error on Debian/Ubuntu

On some newer Debian-based systems, you may see:

```text
lua_ls quit with exit code 127
error while loading shared libraries: libbfd-2.38-system.so: cannot open shared object file
```

Your system provides:

```text
libbfd-2.42-system.so
```

but the Lua language server binary expects:

```text
libbfd-2.38-system.so
```

---

## ✅ Solution: Create a compatibility symlink

Check which `libbfd` version you have:

```bash
ls /usr/lib/x86_64-linux-gnu | grep libbfd
```

If you see something like:

```text
libbfd-2.42-system.so
```

create a compatibility symlink:

```bash
sudo ln -s /usr/lib/x86_64-linux-gnu/libbfd-2.42-system.so            /usr/lib/x86_64-linux-gnu/libbfd-2.38-system.so
```

Then test:

```bash
~/.local/share/nvim/mason/packages/lua-language-server/lua-language-server --version
```

If a version prints (e.g. `3.16.0`), the fix is successful.

---

This is a known issue with some prebuilt `lua-language-server` binaries on newer distributions. The symlink keeps your system libraries intact while satisfying the expected name.
