local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General
map("n", "<Space>", "", {})  -- Space as leader
map("n", "<leader>h", ":nohlsearch<CR>", opts)  -- Clear search highlight
map("n", "<leader>e", ":e .<CR>", opts)  -- Open file explorer

-- Resize windows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, opts)
map("n", "<leader>fg", builtin.git_files, opts)
map("n", "<leader>fb", builtin.buffers, opts)
map("n", "<leader>fs", builtin.live_grep, opts)

-- Terminal
map("n", "<leader>tt", ":botright vsplit| vertical resize 75% | terminal<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)

-- Harpoon
local harpoon_ok, harpoon = pcall(require, "harpoon")
if harpoon_ok then
  map("n", "<leader>ha", function() harpoon:list():add() end, opts)
  map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)
  map("n", "<leader>h1", function() harpoon:list():select(1) end, opts)
  map("n", "<leader>h2", function() harpoon:list():select(2) end, opts)
  map("n", "<leader>h3", function() harpoon:list():select(3) end, opts)
  map("n", "<leader>h4", function() harpoon:list():select(4) end, opts)
  map("n", "<leader>hn", function() harpoon:list():next() end, opts)
  map("n", "<leader>hp", function() harpoon:list():prev() end, opts)
end

-- Git (fugitive)
local function setup_fugitive_keymaps()
  local bufnr = vim.api.nvim_get_current_buf()
  local buf_opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "<leader>p", function() vim.cmd.Git("push") end, buf_opts)
  vim.keymap.set("n", "<leader>P", function() vim.cmd.Git({ "pull", "--rebase" }) end, buf_opts)
  vim.keymap.set("n", "<leader>t", ":Git push -u origin ", buf_opts)
end

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("FugitiveKeymaps", { clear = true }),
  pattern = "*",
  callback = function()
    if vim.bo.ft == "fugitive" then
      setup_fugitive_keymaps()
    end
  end,
})

map("n", "<leader>gs", vim.cmd.Git, opts)
map("n", "gu", "<cmd>diffget //2<CR>", opts)
map("n", "gh", "<cmd>diffget //3<CR>", opts)

