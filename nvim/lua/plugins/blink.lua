return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    'rafamadriz/friendly-snippets',
  },
  
  -- The modern way to build blink.cmp depends on what environment tools you have.
  -- Use the cargo build script which compiles the Rust code automatically.
  build = 'cargo build --release',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },
    completion = { documentation = { auto_show = false } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    -- fuzzy = { implementation = "rust" },
    fuzzy = { implementation = "lua" }
  },
}
