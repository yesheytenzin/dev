local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map("n", "<Space>", "", {})  -- Space as leader
map("n", "<>h", ":nohlsearch<CR>", opts)  -- Clear search highlight

-- Window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer navigation
map("n", "<>bn", ":bnext<CR>", opts)
map("n", "<>bp", ":bprevious<CR>", opts)
map("n", "<>bd", ":bdelete<CR>", opts)

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- FZF
map("n", "<>ff", ":Files<CR>", opts)
map("n", "<>fg", ":GFiles<CR>", opts)
map("n", "<>fb", ":Buffers<CR>", opts)

-- Open terminal at the bottom
vim.keymap.set("n", "<leader>tt", ":botright split | resize 15 | terminal<CR>", { noremap = true, silent = true })

-- Exit terminal mode with <Esc>
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

