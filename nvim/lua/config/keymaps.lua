local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Space as leader is set in lazy.lua

-- General
map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp", ":bprevious<CR>", opts)
map("n", "<leader>bd", ":bdelete<CR>", opts)

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- FZF (legacy - telescope is preferred)
map("n", "<leader>ff", ":Files<CR>", opts)
map("n", "<leader>fg", ":GFiles<CR>", opts)
map("n", "<leader>fb", ":Buffers<CR>", opts)

-- Terminal
map("n", "<leader>tt", ":botright vsplit| vertical resize 75% | terminal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- LSP
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

-- Files
map("n", "<leader>e", ":e .<CR>", opts)

-- Git
map("n", "<leader>u", vim.cmd.UndotreeToggle, opts)
map("n", "<leader>gs", vim.cmd.Git, opts)
