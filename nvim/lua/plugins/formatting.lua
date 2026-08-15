return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          ruby = { "rubocop" },
          eruby = { "htmlbeautifier" },
          c = { "clang_format" },
          cpp = { "clang_format" },
        },
        default_format_opts = {
          lsp_format = "fallback",
        },
      })
    end,
  },
}
