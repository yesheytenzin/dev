return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "c", "lua", "rust", "bash", "go", "cpp", "javascript", "python", "typescript", "tsx", "json", "yaml", "toml" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
