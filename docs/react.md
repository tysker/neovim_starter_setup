# ⚛️ React / TypeScript Setup

This configuration provides full React and TypeScript support using `vtsls`.

---

## Features

- Automatic imports via completion and code actions
- Code actions for missing imports
- JSX/TSX tag auto-closing and renaming
- Tailwind CSS support
- Intelligent completion via LSP + nvim-cmp

---

## Filetypes

- `javascript`
- `javascriptreact`
- `typescript`
- `typescriptreact`

---

## Usage

### Auto imports

Start typing a symbol:

```tsx
useState;
```

Select it from completion to automatically insert:

```tsx
import { useState } from "react";
```

---

### Code actions

Use:

```
<leader>ca
```

To:

- add missing imports
- organize imports
- fix issues

---

### JSX tag syncing

When editing JSX:

```tsx
<div></div>
```

Changing the opening tag will update the closing tag automatically.

---

## Requirements

- Node.js installed
- `vtsls` installed via Mason

---

## Troubleshooting

### No auto-imports?

Check:

- LSP is attached: `:LspInfo`
- Filetype is correct: `:set filetype?`
  - should be `typescriptreact` or `javascriptreact`

### JSX tag not updating?

Ensure:

- `nvim-ts-autotag` is installed
- Treesitter parser for `tsx` is installed:
