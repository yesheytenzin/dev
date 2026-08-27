-- Entire UI classic - Vim defaults (keep blink but classic)
return {
  { "folke/noice.nvim", enabled = false },
  { "stevearc/dressing.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      notifier = { enabled = false },
      input = { enabled = false },
      picker = { enabled = false },
      indent = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      image = { enabled = false },
      explorer = { enabled = false },
    },
  },
  { "nvim-lualine/lualine.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
}
