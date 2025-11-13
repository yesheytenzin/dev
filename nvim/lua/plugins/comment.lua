return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
      vim.keymap.set('n', '<Leader>/', ':CommentToggle<CR>')
    end
  }
}

