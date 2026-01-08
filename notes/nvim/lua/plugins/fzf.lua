return {
  {
    "junegunn/fzf",
    run = function() vim.fn["fzf#install"]() end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    config = function()
      vim.g.fzf_layout = { window = { width = 0.9, height = 0.6 } }
    end,
  },
}

