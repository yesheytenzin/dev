return {
  -- Theme plugins kept lazy for hot-reloading
  -- Omarchy manages the active colorscheme (catppuccin)
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    priority = 1000,
  },
  {
    "neanias/everforest-nvim",
    lazy = true,
    priority = 1000,
  },
  { "kepano/flexoki-neovim", name = "flexoki", lazy = true },
  { "navarasu/onedark.nvim", name = "one-dark-pro", lazy = true },
}
