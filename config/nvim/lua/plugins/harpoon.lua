return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>ha", function() harpoon:list():add() end, desc = "Harpoon add file" },
      { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon quick menu" },
      { "<leader>h1", function() harpoon:list():select(1) end, desc = "Harpoon to file 1" },
      { "<leader>h2", function() harpoon:list():select(2) end, desc = "Harpoon to file 2" },
      { "<leader>h3", function() harpoon:list():select(3) end, desc = "Harpoon to file 3" },
      { "<leader>h4", function() harpoon:list():select(4) end, desc = "Harpoon to file 4" },
      { "<leader>hr1", function() harpoon:list():replace_at(1) end, desc = "Harpoon replace file 1" },
      { "<leader>hr2", function() harpoon:list():replace_at(2) end, desc = "Harpoon replace file 2" },
      { "<leader>hr3", function() harpoon:list():replace_at(3) end, desc = "Harpoon replace file 3" },
      { "<leader>hr4", function() harpoon:list():replace_at(4) end, desc = "Harpoon replace file 4" },
    }
  end,
}
