-- Git signs in the gutter + handy hunk actions
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    signs_staged = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    -- Highlight current line blame (faded, non-intrusive)
    current_line_blame = true,
    current_line_blame_opts = {
      delay = 400, -- how long until blame text appears
      virt_text_pos = 'eol',
    },

    -- Automatically attach keymaps when a git-tracked file opens
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        gs.next_hunk()
      end)

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        gs.prev_hunk()
      end)

      -- Actions
      map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>hb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)

      -- Toggle signs if needed
      map('n', '<leader>ht', gs.toggle_signs)
    end,
  },
}
