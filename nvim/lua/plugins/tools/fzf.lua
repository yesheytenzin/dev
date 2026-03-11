return {
  {
    "junegunn/fzf",
    build = "./install --all",
  },
  {
    "junegunn/fzf.vim",
    dependencies = { "junegunn/fzf" },
    init = function()
      vim.g.fzf_layout = {
        window = {
          width = 1.0,
          height = 1.0,
        },
      }
    end,
  },
}
