-- return {
  -- {
    -- "nvim-lualine/lualine.nvim",
    -- enabled = false, -- This disables the plugin completely
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- config = function()
      -- require('lualine').setup {
        -- options = { theme = 'tokyonight' }
      -- }
    -- end
  -- }
-- }
return {
	{
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
        globalstatus = true, -- single bar across splits (recommended)
      },
    })
  end
	}
}

