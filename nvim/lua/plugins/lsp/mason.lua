return {
  {
    "mason-org/mason.nvim",
    lazy = true,
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      automatic_installation = true,
      ensure_installed = {
        "vtsls", "tailwindcss", "html", "cssls", "jsonls", "emmet_ls",
        "pyright",
        "gopls", "rust_analyzer", "clangd", "zls",
        "jdtls", "kotlin_language_server", "omnisharp",
        "volar", "prismals",
        "bashls", "awk_ls",
        "yamlls", "marksman",
        "dockerls", "docker_compose_language_service",
        "terraformls", "helm_ls", "ansiblels",
        "sqlls", "taplo",
      },
    },

    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local on_attach = function(_, _) end

      -------------------------------------------------
      -- DEFAULT: configure all servers
      -------------------------------------------------
      for _, server in ipairs(opts.ensure_installed) do
        vim.lsp.config(server, {
          capabilities = capabilities,
          on_attach = on_attach,
        })
        vim.lsp.enable(server)
      end

      -------------------------------------------------
      -- OVERRIDES
      -------------------------------------------------

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "require" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          ["rust-analyzer"] = {
            check = { command = "clippy" },
          },
        },
      })

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                "className=\"([^\"]*)\"",
                "class=\"([^\"]*)\"",
              },
            },
          },
        },
      })

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          json = {
            validate = { enable = true },
          },
        },
      })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      })
    end,
  },
}
