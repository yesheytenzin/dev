return {
  "folke/which-key.nvim",
  opts = {
    preset = "helix",
    delay = 150,
    win = {
      border = "none",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
      wo = { winblend = 0 },
      -- no row/col/width -> centered compact, NOT full-length bottom bar
    },
    layout = {
      width = { min = 20, max = 40 },
      spacing = 4,
      align = "left",
    },
  },
}
