return {
  -- 🌙 Tokyonight theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night", -- or "storm", "moon", "day"
      transparent = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  -- 🌹 Rose Pine theme
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- "main", "moon", "dawn"
        dark_variant = "main",
        disable_background = false,
      })
      -- Uncomment this to use rose-pine instead
      -- vim.cmd.colorscheme("rose-pine")
    end,
  },
}

