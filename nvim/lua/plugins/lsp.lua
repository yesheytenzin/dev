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

      -- Define the LSP keybindings function to attach to every server active buffer
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        -- Navigation & Definitions
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = bufnr, desc = "Show References" })
        vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to Type Definition" })

        -- Information Popups (Hover & Documentation)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Help" })

        -- Actions (Refactoring & Fixing)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename Symbol" })
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Actions" })

        -- Diagnostics (Errors & Warnings navigation)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous Diagnostic" })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next Diagnostic" })
        vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { buffer = bufnr, desc = "Line Diagnostics Float" })
      end

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

      -- Loop through and dynamically initialize each server with capabilities and keybinds
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { 
          capabilities = capabilities,
          on_attach = on_attach
        })
      end
    end,
  },
}
