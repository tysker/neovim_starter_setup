-- =========================================================
-- Leader Keys
-- =========================================================
vim.g.mapleader = ' ' -- Space as leader
vim.g.maplocalleader = ' '

-- Disable <Space> from doing anything by default
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For shorter options
local opts = { noremap = true, silent = true }

-- =========================================================
-- File actions
-- =========================================================
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', opts) -- Save file
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w<CR>', opts) -- Save without formatting
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', opts) -- Quit

-- =========================================================
-- Editing improvements
-- =========================================================
vim.keymap.set('n', 'x', '"_x', opts) -- Delete char without yanking
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts) -- Scroll down and center
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts) -- Scroll up and center
vim.keymap.set('n', 'n', 'nzzzv', opts) -- Next search result + center
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Stay in visual mode when indenting
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Paste without overwriting registef
vim.keymap.set('v', 'p', '"_dP', opts)

-- =========================================================
-- Window management
-- =========================================================
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- Vertical split
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- Horizontal split
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- Equal size
vim.keymap.set('n', '<leader>xs', '<cmd>close<CR>', opts)

-- Resize window
vim.keymap.set('n', '<M-a>', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<M-z>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<M-s>', '<cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<M-x>', '<cmd>vertical resize +2<CR>')

-- Move between splits
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- =========================================================
-- Buffers
-- =========================================================
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts) -- Close buffer
vim.keymap.set('n', '<leader>b', '<cmd>enew<CR>', opts) -- New buffer

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
-- CMD
-- =========================================================
vim.keymap.set('c', '<C-l>', '<C-y>', { noremap = true })

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
