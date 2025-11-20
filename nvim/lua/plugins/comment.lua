return {
    "terrortylor/nvim-comment",
    config = function()
        local nvim_comment = require("nvim_comment")

        nvim_comment.setup({
            comment_empty = false,      -- Don't comment empty lines
            marker_padding = true,      -- Add space between marker and code
            line_mapping = "<leader>c", -- Toggle comment on current line
            operator_mapping = "gc",    -- Operator-pending mapping
            hook = nil,                 -- Pre/post hooks
        })

    end
}

