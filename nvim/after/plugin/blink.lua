local ok = pcall(require, "blink.cmp")
if not ok then return end

require("blink.cmp").setup({
  snippets = { preset = "default" },
  sources = {
    default = { "lsp", "snippets", "path", "buffer" },
  },
  keymap = {
    preset = "default",
    ["<C-space>"] = { "show", "hide" },
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    ["<C-e>"] = { "hide" },
    ["<C-b>"] = { "scroll_documentation_up" },
    ["<C-f>"] = { "scroll_documentation_down" },
  },
  appearance = { nerd_font_variant = "mono" },
  signature = { enabled = true },
})
