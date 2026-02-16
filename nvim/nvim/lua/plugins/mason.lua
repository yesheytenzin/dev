return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim" }, -- Mason core
            "neovim/nvim-lspconfig",       -- LSP configurations
        },
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
            automatic_installation = true,
        },
        config = function(_, opts)
            require("mason").setup()
            require("mason-lspconfig").setup(opts)
        end,
    },
}

