return {
  'L3MON4D3/LuaSnip',
  config = function()
    local ls = require 'luasnip'
    local s = ls.snippet
    local t = ls.text_node
    local f = ls.function_node

    ls.add_snippets('javascript', {
      s('csm', {
        t "import styles from './",
        f(function()
          return vim.fn.expand '%:t:r'
        end),
        t ".module.css'",
      }),
    })
  end,
}
