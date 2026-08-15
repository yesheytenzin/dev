return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config("*", { capabilities = capabilities })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

       vim.lsp.enable({ "lua_ls", "ruby_lsp", "clangd" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local group = vim.api.nvim_create_augroup("config-lsp-signature-" .. event.buf, { clear = true })
          vim.api.nvim_create_autocmd("InsertCharPre", {
            buffer = event.buf,
            group = group,
            callback = function()
              if vim.v.char == "(" or vim.v.char == "," then
                vim.schedule(vim.lsp.buf.signature_help)
              end
            end,
          })
          vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
          if vim.lsp.get_client_by_id(event.data.client_id) then
            vim.bo[event.buf].formatexpr = "v:lua.vim.lsp.formatexpr()"
          end
        end,
      })

    end,
  },
}
