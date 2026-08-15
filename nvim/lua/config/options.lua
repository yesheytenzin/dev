local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.autoindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.visualbell = true
opt.scrolloff = 5
opt.clipboard = "unnamedplus"
opt.laststatus = 3
opt.cmdheight = 0
opt.swapfile = false

-- persistent undo
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"


-- Start Neovim server for remote control (enables theme-change hooks)
-- Check if server is already running, if not start one
vim.defer_fn(function()
    if vim.v.servername == "" then
        local server_name = vim.fn.stdpath("run") .. "/nvim." .. vim.fn.getpid() .. ".sock"
        vim.fn.serverstart(server_name)
    end
end, 100)
