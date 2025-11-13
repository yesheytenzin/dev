return {
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "cpp", "lua", "python", "javascript" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  }
}

