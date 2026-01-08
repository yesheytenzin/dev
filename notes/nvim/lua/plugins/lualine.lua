return {
  {
    "nvim-lualine/lualine.nvim",
    enabled = false, -- This disables the plugin completely
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require('lualine').setup {
        options = { theme = 'tokyonight' }
      }
    end
  }
}

