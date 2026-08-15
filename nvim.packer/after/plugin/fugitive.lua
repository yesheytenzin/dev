local function fugitive_keymaps()
  local opts = { buffer = true, remap = false }
  vim.keymap.set("n", "<leader>gp", function() vim.cmd.Git("push") end, opts)
  vim.keymap.set("n", "<leader>gP", function() vim.cmd.Git({ "pull", "--rebase" }) end, opts)
  vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts)
end

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("FugitiveKeymaps", { clear = true }),
  pattern = "fugitive://*",
  callback = fugitive_keymaps,
})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Fugitive: git status" })
