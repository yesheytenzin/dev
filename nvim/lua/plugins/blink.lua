return {
    'saghen/blink.cmp',
    dependencies = {
        'saghen/blink.lib',
        'rafamadriz/friendly-snippets',
    },

    build = 'cargo build --release',
    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        snippets = {
            preset = "default",
        },
        appearance = {
            nerd_font_variant = "mono",
        },
        keymap = { 
            -- The magic happens here: we explicitly force the snippet to clear 
            -- if the completion menu is closed, breaking the sticky context loop.
            ["<CR>"] = { 
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_and_accept()
                    elseif cmp.snippet_active() then
                        cmp.snippet_forward()
                        return true
                    end
                end,
                "fallback" 
            },

            ["<C-y>"] = { "select_and_accept" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
        },
        completion = { 
            documentation = { auto_show = true },
            menu = {
                draw = {
                    treesitter = { "lsp" },
                    columns = {
                        { "kind_icon" },
                        { "label", "label_description", gap = 1 },
                        { "source_name" },
                    },
                },
            },
        },

        sources = { 
            default = { 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                snippets = {
                    score_offset = 50,  
                },
                lsp = {
                    score_offset = 100, -- Forces LSP definitions to stay structurally first
                },
                path = {
                    score_offset = 20,
                },
                buffer = {
                    score_offset = 0,   
                },
            },
        },

        fuzzy = { implementation = "rust" },
        cmdline = {
            enabled = true,
            keymap = {
                preset = "cmdline",
                ["<Right>"] = false,
                ["<Left>"] = false,
            },
            completion = {
                list = { selection = { preselect = false } },
                menu = {
                    auto_show = function(ctx)
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
                ghost_text = { enabled = true },
            },
        },
    },
}
