return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<Leader>ff', builtin.find_files)
      vim.keymap.set('n', '<Leader>fg', builtin.git_files)
      vim.keymap.set('n', '<Leader>fb', builtin.buffers)
      vim.keymap.set('n', '<Leader>fs', builtin.live_grep)
    end
  }
}


