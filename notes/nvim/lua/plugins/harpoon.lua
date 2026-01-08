return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- Setup Harpoon v2
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- File navigation
    map("n", "<leader>ha", function() harpoon:list():add() end, opts)               -- Add current file
    map("n", "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts) -- Toggle Harpoon menu

    -- Jump to marks
    map("n", "<leader>h1", function() harpoon:list():select(1) end, opts)
    map("n", "<leader>h2", function() harpoon:list():select(2) end, opts)
    map("n", "<leader>h3", function() harpoon:list():select(3) end, opts)
    map("n", "<leader>h4", function() harpoon:list():select(4) end, opts)

    -- Navigate through Harpoon list
    map("n", "<leader>hn", function() harpoon:list():next() end, opts)
    map("n", "<leader>hp", function() harpoon:list():prev() end, opts)

    -- Open terminal at bottom (not via Harpoon, since term_list is gone)
    map("n", "<leader>tt", ":botright split | resize 15 | terminal<CR>", opts)
    map("t", "<Esc>", "<C-\\><C-n>", opts)
  end,
}

