local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.autoindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smarttab = true
opt.encoding = "utf-8"
opt.visualbell = true
opt.scrolloff = 5
opt.fillchars = { eob = " " }

opt.laststatus = 3  -- for avante (commented out to disable statusline)

-- persistent undo
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"

if vim.fn.has("termguicolors") == 1 then
  opt.termguicolors = true
end

-- Start Neovim server for remote control (enables theme-change hooks)
-- Check if server is already running, if not start one
vim.defer_fn(function()
  if vim.v.servername == "" then
    local server_name = vim.fn.stdpath("run") .. "/nvim." .. vim.fn.getpid() .. ".sock"
    vim.fn.serverstart(server_name)
  end
end, 100)
