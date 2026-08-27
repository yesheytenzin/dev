-- Autocmds: Rails API + C++ (VeryLazy)
-- Default autocmds: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

-- Ruby/Rails API: 2-space indent, no wrap
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby", "eruby", "yaml" },
  callback = function() vim.opt_local.shiftwidth = 2; vim.opt_local.tabstop = 2; vim.opt_local.expandtab = true end,
})

-- C/C++: 2-space (or 4) - clangd will format, keep 2 for consistency with Rails
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp" },
  callback = function() vim.opt_local.shiftwidth = 2; vim.opt_local.tabstop = 2; vim.opt_local.expandtab = true end,
})
