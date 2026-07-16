return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        opts = {},
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason.nvim",
        },
        opts = {
            auto_install = true,
            ensure_installed = {
                "lua_ls",
                "ruby_lsp",
                "tailwindcss",
                "ts_ls",
                "html",
                "cssls",
                "jsonls",
                "yamlls",
                "bashls",
                "gopls",
                "clangd",
                "rust_analyzer",
            },
        },
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,

        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            vim.lsp.config("*", {
                capabilities = capabilities,
            })

            local mason_lspconfig = require("mason-lspconfig")

            for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
                vim.lsp.enable(server)
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ async = true })
                    end, opts)
                end,
            })
        end,
    },
}
