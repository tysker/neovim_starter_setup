return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  config = function()
    require('conform').setup {

      format_on_save = {
        timeout_ms = 500,
        lsp_format = 'fallback',
      },

      formatters_by_ft = {
        lua = { 'stylua' },

        python = { 'ruff_format' },

        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        css = { 'prettierd' },
        scss = { 'prettierd' },

        json = { 'prettierd' },
        yaml = { 'prettierd' },
        markdown = { 'prettierd' },

        openscad = { 'openscad_format' },
      },

      formatters = {
        openscad_format = {
          command = 'bash',
          args = {
            '-lc',
            'set -euo pipefail; tmp="$(mktemp --suffix=.scad)"; trap \'rm -f "$tmp"\' EXIT; cat > "$tmp"; openscad-format -i "$tmp" -f >/dev/null; cat "$tmp"',
          },
          stdin = true,
        },
      },
    }
  end,
}
