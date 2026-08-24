-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require('config.remote_clipboard').setup()
vim.opt.relativenumber = false
vim.g.autoformat = false

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false, signs = false })
  end,
})
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

