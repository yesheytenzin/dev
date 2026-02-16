return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2", -- use v2 branch (modern)
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- Setup Harpoon
    harpoon:setup({
      settings = {
        save_on_toggle = true, -- auto-save list when toggled
        sync_on_ui_close = true,
      },
      term = {
        direction = "horizontal", -- bottom split terminal
      },
    })

    -- Define keymaps
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- File navigation
    map("n", "<leader>ha", function() harpoon:list():add() end, opts)          -- Add file to list
    map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts) -- Show menu

    map("n", "<leader>h1", function() harpoon:list():select(1) end, opts)
    map("n", "<leader>h2", function() harpoon:list():select(2) end, opts)
    map("n", "<leader>h3", function() harpoon:list():select(3) end, opts)
    map("n", "<leader>h4", function() harpoon:list():select(4) end, opts)


    -- Optional: Navigation between marks
    map("n", "<leader>hn", function() harpoon:list():next() end, opts)
    map("n", "<leader>hp", function() harpoon:list():prev() end, opts)
  end,
}

