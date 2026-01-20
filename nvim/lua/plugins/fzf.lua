return {
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    init = function()
      vim.g.fzf_layout = {
        window = {
          width = 0.4,
          height = 0.3,
        },
      }
    end,
  },
}

