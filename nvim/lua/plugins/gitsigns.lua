return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      current_line_blame = true,
      
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation between hunks
        map('n', ']c', function()
          if vim.wo.diff then vim.cmd.feedkeys(']c', 'n') else gitsigns.nav_hunk('next') end
        end, { desc = "Next Git Change" })

        map('n', '[c', function()
          if vim.wo.diff then vim.cmd.feedkeys('[c', 'n') else gitsigns.nav_hunk('prev') end
        end, { desc = "Previous Git Change" })

        -- Actions
        -- map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage Hunk" })
        -- map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset Hunk" })
      --   map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview Hunk Change" })
      --   map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end, { desc = "Full Git Blame Line" })
      end
    },
  },
}
