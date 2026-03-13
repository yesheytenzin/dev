return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- REQUIRED for system / terminal colors
      vim.opt.termguicolors = true

      require("nvim-tree").setup({
        renderer = {
          highlight_git = false,
          highlight_opened_files = "none",
        },
        view = {
          signcolumn = "no",
        },
      })

      -- Keymap
      vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")

      -- Force nvim-tree to inherit editor colors
      local hl = vim.api.nvim_set_hl
      hl(0, "NvimTreeNormal",       { link = "Normal" })
      hl(0, "NvimTreeNormalNC",     { link = "NormalNC" })
      hl(0, "NvimTreeEndOfBuffer",  { link = "EndOfBuffer" })
      hl(0, "NvimTreeVertSplit",    { link = "VertSplit" })
      hl(0, "NvimTreeWinSeparator", { link = "WinSeparator" })
      hl(0, "NvimTreeFolderName",   { link = "Directory" })
      hl(0, "NvimTreeOpenedFolderName", { link = "Directory" })
      hl(0, "NvimTreeIndentMarker", { link = "Comment" })

      -- Reload tree when colorscheme changes
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          require("nvim-tree.api").tree.reload()
        end,
      })
    end,
  },
}

