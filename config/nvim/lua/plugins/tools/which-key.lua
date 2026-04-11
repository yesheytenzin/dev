return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- Modern replacement for deprecated 'window'
    win = {
      border = "single",
      padding = { 1, 2, 1, 2 },
      -- Add more if needed, e.g. wo = { winblend = 10 }
    },
    -- Optional: better icons if you add mini.icons later
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "+",
    },
    show_help = true,
    show_keys = true,
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Helpers (unchanged)
    local function telescope(picker)
      return function()
        local ok, builtin = pcall(require, "telescope.builtin")
        if ok and builtin[picker] then
          builtin[picker]()
        end
      end
    end

    local function ts_undo()
      return function()
        local ok, ts = pcall(require, "telescope")
        if ok then
          local ok2, _ = pcall(ts.extensions.undo.undo)
          if ok2 then
            ts.extensions.undo.undo()
          end
        end
      end
    end

    -- All mappings in modern spec format
    wk.add({
      -- Global modes for window nav + clear hlsearch
      mode = { "n", "v" },
      { "<C-h>", "<C-w>h", desc = "Go to left window" },
      { "<C-j>", "<C-w>j", desc = "Go to bottom window" },
      { "<C-k>", "<C-w>k", desc = "Go to top window" },
      { "<C-l>", "<C-w>l", desc = "Go to right window" },

      -- Prefix groups (no action, just labels)
      { "<leader>",      group = "leader" },
      { "<leader>b",     group = "buffers" },
      { "<leader>f",     group = "find" },
      { "<leader>g",     group = "git" },
      { "<leader>l",     group = "lsp" },
      { "<leader>t",     group = "terminal" },
      { "<leader>w",     group = "windows" },
      { "<leader>d",     group = "diagnostics" },
      { "<leader>s",     group = "search" },

      -- Non-leader groups
      { "g",             group = "goto" },
      { "gz",            group = "surround" },
      { "[",             group = "prev" },
      { "]",             group = "next" },

      -- Clear search (normal only)
      { "h", ":nohlsearch<CR>", desc = "Clear search", mode = "n" },

      -- ==================== Leader mappings ====================

      -- Buffers
      { "<leader>bn", ":bnext<CR>", desc = "Next buffer" },
      { "<leader>bp", ":bprevious<CR>", desc = "Previous buffer" },
      { "<leader>bd", ":bdelete<CR>", desc = "Delete buffer" },
      { "<leader>bo", ":%bd|e#|bd#<CR>", desc = "Delete other buffers" },

      -- Find
      { "<leader>ff", telescope("find_files"), desc = "Find files" },
      { "<leader>fg", telescope("git_files"), desc = "Git files" },
      { "<leader>fb", telescope("buffers"), desc = "Buffers" },
      { "<leader>fs", telescope("live_grep"), desc = "Search text" },
      { "<leader>fu", ts_undo(), desc = "Undo history" },
      { "<leader>fh", telescope("help_tags"), desc = "Help tags" },
      { "<leader>fr", telescope("oldfiles"), desc = "Recent files" },

      -- Git
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
      { "<leader>gb", telescope("git_branches"), desc = "Branches" },
      { "<leader>gc", telescope("git_commits"), desc = "Commits" },
      { "<leader>gl", telescope("git_bcommits"), desc = "Buffer commits" },

      -- Terminal
      { "<leader>tt", ":botright vsplit | vertical resize 75% | terminal<CR>",
        desc = "Terminal split" },

      -- LSP
      { "<leader>la", vim.lsp.buf.code_action, desc = "Code action" },
      { "<leader>ld", telescope("lsp_definitions"), desc = "Definitions" },
      { "<leader>lr", telescope("lsp_references"), desc = "References" },
      { "<leader>li", telescope("lsp_implementations"), desc = "Implementations" },
      { "<leader>ls", telescope("lsp_document_symbols"), desc = "Document symbols" },
      { "<leader>lw", telescope("lsp_workspace_symbols"), desc = "Workspace symbols" },
      { "<leader>lh", vim.lsp.buf.signature_help, desc = "Signature help" },
      { "<leader>ln", vim.lsp.buf.rename, desc = "Rename" },

      -- Windows
      { "<leader>wh", "<C-w>h", desc = "Left" },
      { "<leader>wj", "<C-w>j", desc = "Bottom" },
      { "<leader>wk", "<C-w>k", desc = "Top" },
      { "<leader>wl", "<C-w>l", desc = "Right" },
      { "<leader>wv", "<C-w>v", desc = "Vertical split" },
      { "<leader>ws", "<C-w>s", desc = "Horizontal split" },
      { "<leader>wq", "<C-w>q", desc = "Close window" },
      { "<leader>wo", "<C-w>o", desc = "Close other windows" },
      { "<leader>w=", "<C-w>=", desc = "Equal size" },
      { "<leader>w+", "<C-w>+", desc = "Increase height" },
      { "<leader>w-", "<C-w>-", desc = "Decrease height" },
      { "<leader>w>", "<C-w>>", desc = "Increase width" },
      { "<leader>w<", "<C-w><", desc = "Decrease width" },

      -- Extra (from your second register block)
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "Undo tree" },
      { "<leader>e", ":e .<CR>", desc = "Explorer" },
    })
  end,
}
