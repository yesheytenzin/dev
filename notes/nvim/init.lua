require("config.lazy")
require("config.colors")
require("config.options")
require("config.keymaps")

vim.opt.laststatus = 0
-- Permanently hide Neovim statusline
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.opt.laststatus = 0
    vim.opt.showmode = false
    vim.opt.cmdheight = 1
  end,
})

