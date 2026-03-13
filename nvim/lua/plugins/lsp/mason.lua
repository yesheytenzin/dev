return {
  -- Mason (package manager for LSPs, formatters, linters, debuggers…)
  {
    "mason-org/mason.nvim",
    lazy = true,   -- loaded on demand via :Mason or when needed
    cmd = "Mason",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },  -- nicer look (optional)
      })
    end,
  },

  -- Bridge: auto-install + auto-enable LSP servers from mason via lspconfig names
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = true,
    cmd = { "LspInstall", "LspUninstall" },
    event = { "BufReadPre", "BufNewFile" },  -- lazy-load when opening files

    opts = {
      automatic_installation = true,   -- install missing servers from ensure_installed
      -- automatic_enable     = true,  -- default = true → auto vim.lsp.enable()
	  ensure_installed = {
  -- JavaScript/TypeScript + frontend
  "ts_ls", "vtsls", "volar", "tailwindcss", "html", "cssls", "jsonls", "emmet_ls", "eslint", "biome",

  -- Python
  "basedpyright", "ruff", "pyright", "pylsp",

  -- Go / Rust / Systems
  "gopls", "rust_analyzer", "clangd", "zls",     -- Zig

  -- JVM / .NET
  "jdtls", "kotlin_language_server", "omnisharp",

  -- Web / Other frontend
  "svelte", "astro", "vuels", "prismals",

  -- Scripting / Shell
  "bashls", "awk_ls",

  -- Config / Markup / Infra
  "yamlls", "marksman",     -- Markdown
  "dockerls", "docker_compose_language_service",
  "terraformls", "helm_ls", "ansiblels",
  "sqlls", "taplo",         -- TOML
  "lemminx",                -- XML
  "autotools_ls",

  -- Others (PHP, etc.)
  "intelephense",           -- PHP
  "typst_lsp",              -- Typst
  "ltex", "harper_ls",      -- better spell/grammar for md/tex/plaintext
  "typos_lsp",              -- typo detection in code
}
    },

    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- If you later add completion → uncomment one of these:
      -- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      -- capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

      -- Empty → NO automatic keymaps / actions added
      local on_attach = function(client, bufnr)
        -- intentionally empty — add your own keymaps elsewhere if you want
      end

      -- Only override the servers that usually need custom settings
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim", "require" } },
            workspace   = { checkThirdParty = false },
            telemetry   = { enable = false },
            hint        = { enable = true },  -- inlay hints
          },
        },
      })

      vim.lsp.config("basedpyright", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings = {
          basedpyright = {
            analysis = { typeCheckingMode = "standard" },  -- "strict" / "off" possible
          },
        },
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings = {
          gopls = {
            analyses    = { unusedparams = true },
            staticcheck = true,
            hints       = { assignVariableTypes = true, constantValues = true },
          },
        },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        on_attach    = on_attach,
        settings = {
          ["rust-analyzer"] = {
            check       = { command = "clippy" },
            procMacro   = { enable = true },
          },
        },
      })

      -- All other servers in ensure_installed → default config + shared cap/on_attach
    end,
  },
}
