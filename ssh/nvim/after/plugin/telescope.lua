local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then return end

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>ts', function()
  builtin.colorscheme({ enable_preview = true, ignore_builtins = true })
end, { desc = 'Telescope colorscheme' })
