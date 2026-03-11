return {
  {
    "mason-org/mason.nvim",  -- updated repo org
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",  -- still required for default configs
    },
    opts = {
      automatic_installation = true,
      -- automatic_enable = true,   -- this is the default now; can set to false if you want manual control
      -- Optional: pin servers you always want
      -- ensure_installed = { "lua_ls", "ts_ls", "vue_ls", "tailwindcss" },
    },
    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- Shared setup pieces
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- If using completion plugin (nvim-cmp, blink.cmp, etc.):
      -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local on_attach = function(client, bufnr)
        -- Your common LSP keymaps, inlay hints, diagnostics, etc. go here
        -- Example:
        -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
      end

      -- Configure servers you care about (nvim-lspconfig defaults load automatically)
      -- You only need this for overrides/custom settings
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            telemetry = { enable = false },
            -- workspace = { checkThirdParty = false },
          },
        },
      })

      -- Example for vue_ls (if you need tweaks)
      vim.lsp.config("vue_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        -- init_options = { vue = { hybridMode = false } },  -- optional
      })

      -- Add more as needed, e.g. ts_ls, vtsls, tailwindcss, etc.
      -- vim.lsp.config("ts_ls", { ... })
    end,
  },
}
