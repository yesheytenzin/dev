return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local config = require("nvim-treesitter.config")
            config.setup({
                auto_install = true,
                ensure_installed = {
                    "lua", "vim", "vimdoc", "ruby", "html", 
                    "embedded_template", "c", "cpp", "bash", 
                    "json", "yaml", "toml", "sql", "markdown", 
                    "markdown_inline",
                },
                highlight = { enable = true },
                indent = { enable = false },
            })
        end
    }
}
