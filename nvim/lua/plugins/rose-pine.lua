return {
  -- 🌙 Tokyo Night theme
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
      -- Colorscheme set by config/colors.lua based on system theme
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
      -- Colorscheme set by config/colors.lua based on system theme
    end,
  },

  -- 🎨 Catppuccin theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = false,
      })
      -- Colorscheme set by config/colors.lua based on system theme
    end,
  },

  -- 🟤 Gruvbox theme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = false,
      })
      -- Colorscheme set by config/colors.lua based on system theme
    end,
  },

  -- 🧊 Nord theme
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      -- Colorscheme set by config/colors.lua based on system theme
    end,
  },

  -- 🌊 Kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = false,
      })
      -- Colorscheme set by config/colors.lua based on system theme
    end,
  },

  -- 🌲 Everforest theme
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        transparent_background_level = 0,
      })
      -- Colorscheme set by config/colors.lua based on system theme
    end,
  },

  { 'kepano/flexoki-neovim', name = 'flexoki' }
}

