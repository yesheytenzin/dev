local ok, mason = pcall(require, "mason")
if not ok then return end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local ok2, mlsp = pcall(require, "mason-lspconfig")
if not ok2 then return end

mlsp.setup({
    ensure_installed = { "lua_ls", "pyright", "ts_ls" },
    automatic_installation = true,
})

local ok3 = pcall(require, "nvim-lspconfig")
if not ok3 then return end

local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.lsp.config['*'] = {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }
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
}

vim.lsp.enable({ "lua_ls", "pyright", "ts_ls" })
