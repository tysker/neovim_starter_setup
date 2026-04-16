-- =========================================================
-- Leader Keys
-- =========================================================
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable <Space> default behavior
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

local opts = { noremap = true, silent = true }

-- =========================================================
-- AI / CodeCompanion
-- =========================================================
local function codecompanion_visual(prompt)
  return function()
    vim.cmd(("'<,'>CodeCompanion %s"):format(prompt))
  end
end

vim.keymap.set('v', '<leader>ai', ":'<,'>CodeCompanion<CR>", { desc = 'AI inline edit' })

vim.keymap.set(
  'v',
  '<leader>ar',
  codecompanion_visual [[Refactor this code to improve readability and maintainability.
- Follow idiomatic best practices
- Use clear naming
- Reduce nesting
- Do not change functionality]],
  { desc = 'Refactor code' }
)

vim.keymap.set(
  'v',
  '<leader>ao',
  codecompanion_visual [[Optimize this code for performance and simplicity.
- Remove unnecessary work
- Prefer clarity over micro-optimizations]],
  { desc = 'Optimize code' }
)

vim.keymap.set(
  'v',
  '<leader>at',
  codecompanion_visual [[Write unit tests for this code.
- Cover normal and edge cases
- Keep tests readable
- Do not modify original code]],
  { desc = 'Generate tests' }
)

vim.keymap.set(
  'v',
  '<leader>ae',
  codecompanion_visual [[Explain this code briefly and clearly.
- Focus on what and why
- Keep it concise]],
  { desc = 'Explain code' }
)

vim.keymap.set(
  'v',
  '<leader>as',
  codecompanion_visual [[Review this code like a senior engineer.
- Point out bugs
- Suggest improvements
- Be concise]],
  { desc = 'Code review' }
)

vim.keymap.set(
  'v',
  '<leader>am',
  codecompanion_visual [[Rewrite this code to be idiomatic.
- Follow conventions
- Improve naming
- Keep behavior identical]],
  { desc = 'Make idiomatic' }
)

vim.keymap.set(
  'v',
  '<leader>al',
  codecompanion_visual [[Add useful logging.
- Focus on important state
- Avoid noise]],
  { desc = 'Add logging' }
)

vim.keymap.set({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionActions<CR>', { desc = 'AI actions' })
vim.keymap.set({ 'n', 'v' }, '<leader>ac', '<cmd>CodeCompanionChat Toggle<CR>', { desc = 'AI chat' })

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
vim.keymap.set('n', '<Del>', '"_x', opts)

vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('v', 'p', '"_dP', opts)

-- Move lines
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

-- Resize windows
vim.keymap.set('n', '<M-a>', '<cmd>resize +2<CR>', opts)
vim.keymap.set('n', '<M-z>', '<cmd>resize -2<CR>', opts)
vim.keymap.set('n', '<M-s>', '<cmd>vertical resize -2<CR>', opts)
vim.keymap.set('n', '<M-x>', '<cmd>vertical resize +2<CR>', opts)

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
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
-- Toggles
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
-- Diagnostics / LSP
-- =========================================================
vim.keymap.set('n', 'dn', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev diagnostic' })

vim.keymap.set('n', 'nd', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next diagnostic' })

vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Diagnostics list' })

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover docs' })
