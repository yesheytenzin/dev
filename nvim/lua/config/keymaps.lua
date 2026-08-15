vim.g.mapleader = " "

local map = vim.keymap.set

-- General navigation
map("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlight" })
map("n", "<leader>ww", "<C-w>w", { desc = "Switch window" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wo", "<C-w>o", { desc = "Keep only current window" })
map("n", "<leader>tv", "<cmd>botright vsplit | vertical resize 60 | terminal<CR>",
  { desc = "Open vertical terminal (right)" })

-- Diagnostics
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("config-lsp-keymaps", { clear = true }),
  callback = function(event)
    local opts = { buffer = event.buf }
    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "gD", vim.lsp.buf.declaration, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
    map("n", "gi", vim.lsp.buf.implementation, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map("n", "<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, opts)
    map("n", "<leader>ws", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, opts)
  end,
})

-- Telescope
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end,
  { desc = "Telescope find files" })
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end,
  { desc = "Telescope live grep" })
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end,
  { desc = "Telescope buffers" })
map("n", "<leader>fh", function() require("telescope.builtin").help_tags() end,
  { desc = "Telescope help tags" })
map("n", "<leader>ts", function()
  require("telescope.builtin").colorscheme({ enable_preview = true, ignore_builtins = true })
end, { desc = "Telescope colorscheme" })

-- Harpoon
map("n", "<leader>ha", function() require("harpoon"):list():add() end, { desc = "Harpoon add" })
map("n", "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
  { desc = "Harpoon menu" })
for index = 1, 4 do
  map("n", "<leader>h" .. index, function() require("harpoon"):list():select(index) end,
    { desc = "Harpoon select " .. index })
  map("n", "<leader>hr" .. index, function() require("harpoon"):list():replace_at(index) end,
    { desc = "Harpoon replace " .. index })
  map("n", "<leader>hc" .. index, function() require("harpoon"):list():remove_at(index) end,
    { desc = "Harpoon remove " .. index })
end
map("n", "<leader>hn", function() require("harpoon"):list():next() end, { desc = "Harpoon next" })
map("n", "<leader>hp", function() require("harpoon"):list():prev() end, { desc = "Harpoon previous" })
map("n", "<leader>hcx", function() require("harpoon"):list():clear() end, { desc = "Harpoon clear" })

-- Git
map("n", "[h", function() require("gitsigns").prev_hunk() end, { desc = "Previous hunk" })
map("n", "]h", function() require("gitsigns").next_hunk() end, { desc = "Next hunk" })
map("n", "<leader>hs", function() require("gitsigns").stage_hunk() end, { desc = "Stage hunk" })
map("n", "<leader>hR", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })
map("n", "<leader>hP", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
map("n", "<leader>hb", function() require("gitsigns").blame_line() end, { desc = "Blame line" })
map("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })
map("n", "<leader>gp", function() vim.cmd.Git("push") end, { desc = "Git push" })
map("n", "<leader>gP", function() vim.cmd.Git({ "pull", "--rebase" }) end, { desc = "Git pull rebase" })
map("n", "<leader>gt", ":Git push -u origin ", { desc = "Git push to branch" })

-- Rails
map("n", "<leader>rs", function() require("config.rails").server() end, { desc = "Rails server" })
map("n", "<leader>rc", function() require("config.rails").console() end, { desc = "Rails console" })
map("n", "<leader>rr", function() require("config.rails").routes() end, { desc = "Rails routes" })
map("n", "<leader>rm", function() require("config.rails").migrate() end, { desc = "Rails migrate" })
map("n", "<leader>rt", function() require("config.rails").test_current() end,
  { desc = "Run current Rails test" })
map("n", "<leader>lr", function() require("config.rails").refresh_lsp() end,
  { desc = "Refresh Rails LSP" })

-- Formatting
map({ "n", "v" }, "<leader>f", function()
  require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer or selection" })

-- CMake and Raylib
map("n", "<leader>cc", function() require("config.cpp").configure() end, { desc = "CMake configure" })
map("n", "<leader>cb", function() require("config.cpp").build() end, { desc = "CMake build" })
map("n", "<leader>cr", function() require("config.cpp").run() end, { desc = "Run CMake executable" })
map("n", "<leader>cd", function() require("config.cpp").debug() end, { desc = "Debug CMake executable" })

-- C/C++ debugging
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP toggle breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP continue" })
map("n", "<leader>dn", function() require("dap").step_over() end, { desc = "DAP step over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP step into" })
map("n", "<leader>do", function() require("dap").step_out() end, { desc = "DAP step out" })
map("n", "<leader>dx", function() require("dap").terminate() end, { desc = "DAP terminate" })
map("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "DAP REPL" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("config-highlight-yank", { clear = true }),
  callback = vim.highlight.on_yank,
})
