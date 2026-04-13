-- =========================================================
-- Leader Keys
-- =========================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable <Space> from doing anything by default
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- =========================================================
-- AI / CodeCompanion shortcuts
-- =========================================================
local function codecompanion_visual(prompt)
  return function()
    vim.cmd(("'<,'>CodeCompanion %s"):format(prompt))
  end
end

vim.keymap.set('v', '<leader>ai', ":'<,'>CodeCompanion<CR>", {
  desc = 'AI inline edit',
})

vim.keymap.set(
  'v',
  '<leader>ar',
  codecompanion_visual [[Refactor this code to improve readability and maintainability.
- Follow idiomatic best practices for this language
- Use clear naming
- Reduce nesting where possible
- Do not change functionality
- Keep it concise]],
  {
    desc = 'Refactor code',
  }
)

vim.keymap.set(
  'v',
  '<leader>ao',
  codecompanion_visual [[Optimize this code for performance and simplicity.
- Remove unnecessary computations
- Avoid premature optimization
- Prefer clarity over micro-optimizations
- Explain any non-obvious changes briefly]],
  {
    desc = 'Optimize code',
  }
)

vim.keymap.set(
  'v',
  '<leader>at',
  codecompanion_visual [[Write unit tests for this code.
- Cover normal cases, edge cases, and failure cases
- Use clear test names
- Keep tests simple and readable
- Do not modify the original code]],
  {
    desc = 'Generate tests',
  }
)

vim.keymap.set(
  'v',
  '<leader>ae',
  codecompanion_visual [[Explain this code briefly and clearly.
- Focus on what it does and why
- Mention important logic decisions
- Keep it concise]],
  {
    desc = 'Explain code',
  }
)

vim.keymap.set(
  'v',
  '<leader>as',
  codecompanion_visual [[Review this code like a senior engineer.
- Point out potential bugs
- Suggest improvements
- Highlight bad practices
- Be concise]],
  {
    desc = 'Senior code review',
  }
)

vim.keymap.set(
  'v',
  '<leader>am',
  codecompanion_visual [[Rewrite this code to be idiomatic for this language.
- Follow community conventions
- Improve structure and naming
- Keep functionality identical]],
  {
    desc = 'Make code idiomatic',
  }
)

vim.keymap.set(
  'v',
  '<leader>al',
  codecompanion_visual [[Add useful logging to this code.
- Focus on debugging important state
- Do not add excessive noise
- Keep it clean and readable]],
  {
    desc = 'Add logging',
  }
)

vim.keymap.set({ 'n', 'v' }, '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', {
  desc = 'AI chat toggle',
})

vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionActions<CR>', {
  desc = 'AI action palette',
})

-- =========================================================
-- File actions
-- =========================================================
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts)
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts)
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts)

-- =========================================================
-- Editing improvements
-- =========================================================
vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('v', 'p', '"_dP', opts)
vim.keymap.set('n', '<Del>', '"_x', opts)

vim.keymap.set('n', '<A-j>', '<cmd>m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', '<cmd>m .-2<CR>==', opts)

vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- =========================================================
-- Window management
-- =========================================================
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)
vim.keymap.set('n', '<leader>xs', '<cmd>close<CR>', opts)

vim.keymap.set('n', '<M-a>', '<cmd>resize +2<CR>', opts)
vim.keymap.set('n', '<M-z>', '<cmd>resize -2<CR>', opts)
vim.keymap.set('n', '<M-s>', '<cmd>vertical resize -2<CR>', opts)
vim.keymap.set('n', '<M-x>', '<cmd>vertical resize +2<CR>', opts)

vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- =========================================================
-- Buffers
-- =========================================================
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts)

-- =========================================================
-- Tabs
-- =========================================================
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)

-- =========================================================
-- Toggle line wrapping
-- =========================================================
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)

-- =========================================================
-- Command-line mode
-- =========================================================
vim.keymap.set('c', '<C-l>', '<C-y>', { noremap = true })

-- =========================================================
-- Miscellaneous
-- =========================================================
vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', opts)

-- =========================================================
-- Diagnostic keymaps (LSP)
-- =========================================================
vim.keymap.set('n', 'dn', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', 'nd', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open diagnostic popup' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover' })
