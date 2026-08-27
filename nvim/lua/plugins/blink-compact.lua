-- Square border only on blink popup (others remain borderless)
return {
  "saghen/blink.cmp",
  opts = {
    cmdline = { enabled = false }, -- : menu stays native (winborder=none), blink border only for insert
    appearance = { nerd_font_variant = "mono", use_nvim_cmp_as_default = true },
    completion = {
      menu = {
        border = "single",
        winblend = 0,
        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
        scrollbar = false,
        scrolloff = 0,
        max_height = 6,
        min_width = 12,
        direction_priority = { "s", "n" },
        draw = { align_to = "label", padding = 0, gap = 1, columns = { { "label", gap = 1 }, { "kind_icon" } } },
      },
      documentation = { auto_show = false, window = { border = "single", winblend = 0, winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder", max_width = 40, max_height = 6 } },
      ghost_text = { enabled = false },
    },
  },
}
