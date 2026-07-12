return {
  -- 1. Mason to manage external tools
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- 2. Mason-lspconfig to bridge Mason with Neovim's native LSP
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- This ensures Mason automatically downloads them if they are missing
      ensure_installed = { 
        "bashls",
        "clangd",
        "cssls",
        "emmet_language_server",
        "emmet_ls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "ruby_lsp",
        "rust_analyzer",
        "sqlls",
        "sqls",
        "tailwindcss",
        "ts_ls",
        "vtsls",
        "yamlls"
      }, 
    },
  },

  -- 3. Nvim-LSPConfig updated for the modern native Neovim API
  {
    "neovim/nvim-lspconfig",
    dependencies = { 
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp"
    },
    config = function()
      -- Fetch the capabilities from blink.cmp so servers know to send autocompletions
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Array of all your active language servers
      local servers = {
        "bashls",
        "clangd",
        "cssls",
        "emmet_language_server",
        "emmet_ls",
        "gopls",
        "html",
        "jsonls",
        "lua_ls",
        "ruby_lsp",
        "rust_analyzer",
        "sqlls",
        "sqls",
        "tailwindcss",
        "ts_ls",
        "vtsls",
        "yamlls"
      }

      -- Loop through and dynamically initialize each server with blink's capabilities
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
      end
    end,
  },
}
