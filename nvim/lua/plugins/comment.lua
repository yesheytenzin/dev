return {
  {
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
      vim.keymap.set('n', '<Leader>c', ':CommentToggle<CR>')
    end
  }
}

