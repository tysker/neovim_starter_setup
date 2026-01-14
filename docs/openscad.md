# 🧩 OpenSCAD Support

This configuration provides **first-class OpenSCAD support** with a clean separation of concerns:

- syntax highlighting
- language intelligence
- formatting on save
- automatic tool installation

---

## 🧠 Architecture overview

```
.scad file
│
▼
Tree-sitter → syntax & structure
│
▼
openscad-lsp → diagnostics, hover, symbols
│
▼
Conform → format on save
│
▼
openscad-format → consistent formatting
```

---

## 🔍 Syntax Highlighting (Tree-sitter)

Tree-sitter handles:

- syntax highlighting
- indentation
- structural awareness

It installs **parsers only**, not tools or servers.

---

## 🧠 Language Intelligence (LSP)

Provided by **`openscad-lsp`**:

- diagnostics
- hover documentation
- symbols & references (where supported)

The LSP focuses on **understanding code**, not formatting.

---

## ✨ Formatting (Conform)

Formatting on save is handled by **Conform**, not by the LSP.

### Formatter

- **`openscad-format`** (external CLI)
- executed through a small `bash` wrapper inside Conform

This wrapper ensures reliable behavior even when
`openscad-format` does not emit formatted output directly via stdin.

### Formatting flow

1. File is saved
2. Conform runs
3. `openscad-format` formats the file
4. Output is written back to the buffer

If formatting fails, Conform **does not modify the file**.

---

## 📦 Tool Installation (Mason)

Required tools:

- `openscad-lsp` – language server
- `openscad-format` – formatter
- `clang-format` – required dependency

Tool availability is enforced via **mason-tool-installer**.

---

## 🧪 Troubleshooting

### Formatting not running

Check:

```vim
:ConformInfo
```

Expected:

- openscad_format → ready
- command → bash

---

LSP not attached

Check:

```vim
:LspInfo
```

Ensure openscad_lsp is attached to the buffer.
