vim.diagnostic.config({
    underline = false,
    -- virtual_text = {
    --     spacing = 20,
    --     prefix = "●",
    -- },
    update_in_insert = false,
    severity_sort = true,
    signs = {
        text = {
            -- Alas nerdfont icons don't render properly on Medium!
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.HINT]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
        },
    },
})
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
