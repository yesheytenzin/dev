return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",    -- required for v3+
  event = { "BufReadPost", "BufNewFile" },  -- lazy-load only when needed
  opts = {
    indent = {
      char = "▏",          -- slim & elegant vertical bar (alternatives: "│", "┊", "┆")
      tab_char = "▏",      -- same for tabs (or use "→" if you like arrows)
      smart_indent_cap = true,
      priority = 2,        -- lower than most plugin extmarks so it doesn't fight others
    },
    scope = {
      enabled = true,      -- highlight current scope (very helpful)
      show_start = false,  -- don't underline the beginning line
      show_end = false,    -- don't underline the end line
      -- show_exact_scope = true,  -- only highlight the exact scope block
      injected_languages = true,  -- works better in injected code (markdown, html+js, etc.)
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "NvimTree",
        "TelescopePrompt",
        "lspinfo",
      },
      buftypes = {
        "terminal",
        "nofile",
        "quickfix",
        "prompt",
      },
    },
    -- Optional: better integration with colorful themes
    -- (uncomment if you want rainbow-like indent guides)
    -- indent = {
    --   highlight = {
    --     "RainbowRed",
    --     "RainbowYellow",
    --     "RainbowBlue",
    --     "RainbowOrange",
    --     "RainbowGreen",
    --     "RainbowViolet",
    --     "RainbowCyan",
    --   },
    -- },
  },
  config = function(_, opts)
    local hooks = require("ibl.hooks")

    -- Optional: rainbow indent colors (needs colorful theme support)
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed",    { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue",   { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen",  { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan",   { fg = "#56B6C2" })
    end)

    require("ibl").setup(opts)
  end,
}
