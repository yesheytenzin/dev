-- RubyMine-style "Search Everywhere" polish: faster/accurate finding
return {
  -- 1) Make telescope filtering as fast & accurate as RubyMine's index (fzf-native)
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    opts = {
      defaults = {
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "bottom", preview_width = 0.55 },
        -- snappier cycling, mirror RubyMine's Up/Down in search
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
            ["<C-q>"] = function(...)
              return require("telescope.actions").send_to_qflist(...)
            end,
            ["<M-q>"] = function(...)
              return require("telescope.actions").send_selected_to_qflist(...)
            end,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false = exact, true = fzf's fuzzy (RubyMine-like)
          override_generic_sorter = true, -- use fzf for lsp/grep (symbols!)
          override_file_sorter = true, -- use fzf for files (path finding)
          case_mode = "smart_case", -- RubyMine respects case only when you type caps
        },
      },
    },
    keys = {
      -- treesitter symbols: instant, accurate, no LSP wait — RubyMine's "Go to Symbol in file" fallback
      { "<leader>fs", "<cmd>Telescope treesitter<cr>", desc = "Symbols (Treesitter) — instant, no LSP" },
      -- path helpers — RubyMine "Copy Path" / "Find in buffer dir"
      {
        "<leader>fd",
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
        end,
        desc = "Find Files (Buffer Dir)",
      },
      {
        "<leader>fy",
        function()
          local p = vim.fn.expand("%:p")
          vim.fn.setreg("+", p)
          vim.notify("Copied absolute: " .. p)
        end,
        desc = "Copy Absolute Path",
      },
      {
        "<leader>fY",
        function()
          local p = vim.fn.expand("%")
          vim.fn.setreg("+", p)
          vim.notify("Copied relative: " .. p)
        end,
        desc = "Copy Relative Path",
      },
    },
  },
  -- 2) Incremental rename preview — RubyMine's inline rename (overrides <leader>cr when active)
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<leader>cR",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename (inc-rename preview)",
      },
    },
    opts = {},
  },
}
