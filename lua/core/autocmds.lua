-- Detect Ansible inventory (INI-style) files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "hosts", "inventory", "inventory.*", "prod", "stage" },
  callback = function()
    vim.bo.filetype = "ansible"
  end,
})

