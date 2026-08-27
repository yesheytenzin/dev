-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Deferred to VeryLazy: saves /proc reads + OSC52 init at startup
vim.api.nvim_create_autocmd("User", { pattern = "VeryLazy", once = true, callback = function() require("config.remote_clipboard").setup() end })
vim.opt.relativenumber = true
vim.opt.number = true
vim.g.autoformat = false
vim.opt.timeoutlen = 200 -- faster leader recog (was 300)
vim.opt.ttimeoutlen = 10 -- key code fast
vim.opt.updatetime = 150 -- faster CursorHold / which-key (was 200)
vim.opt.mouse = ""
vim.opt.ttyfast = true
vim.opt.redrawtime = 1500
vim.opt.clipboard = "unnamedplus"
vim.o.winborder = "none" -- all floats borderless except blink (single)

-- Silence optional provider warnings (not needed for Rails API + C++ ide)
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

vim.opt.synmaxcol = 300 -- don't highlight super long lines (C++ minified/generated)
vim.opt.maxmempattern = 20000

-- netrw: default neovim UI (vanilla) - no overrides, banner + thin list
-- (removed custom tree/banner settings to use stock defaults)

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
