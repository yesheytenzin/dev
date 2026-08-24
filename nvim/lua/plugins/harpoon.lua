return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    return {
      -- Only add if the current list length is less than 4
      {
        "<leader>ha",
        function()
          if harpoon:list():length() < 4 then
            harpoon:list():add()
          else
            print("Harpoon list is full (Max 4 items)!")
          end
        end, 
        desc = "Harpoon add file" 
      },
      { "<leader>hm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon quick menu" },
      { "<leader>h1", function() harpoon:list():select(1) end, desc = "Harpoon to file 1" },
      { "<leader>h2", function() harpoon:list():select(2) end, desc = "Harpoon to file 2" },
      { "<leader>h3", function() harpoon:list():select(3) end, desc = "Harpoon to file 3" },
      { "<leader>h4", function() harpoon:list():select(4) end, desc = "Harpoon to file 4" },
      { "<leader>hr1", function() harpoon:list():replace_at(1) end, desc = "Harpoon replace file 1" },
      { "<leader>hr2", function() harpoon:list():replace_at(2) end, desc = "Harpoon replace file 2" },
      { "<leader>hr3", function() harpoon:list():replace_at(3) end, desc = "Harpoon replace file 3" },
      { "<leader>hr4", function() harpoon:list():replace_at(4) end, desc = "Harpoon replace file 4" },
      -- Clear keys
      { "<leader>hc1", function() harpoon:list():remove_at(1) end, desc = "Harpoon clear file 1" },
      { "<leader>hc2", function() harpoon:list():remove_at(2) end, desc = "Harpoon clear file 2" },
      { "<leader>hc3", function() harpoon:list():remove_at(3) end, desc = "Harpoon clear file 3" },
      { "<leader>hc4", function() harpoon:list():remove_at(4) end, desc = "Harpoon clear file 4" },
      { "<leader>hcx", function() harpoon:list():clear() end, desc = "Harpoon clear all files" },
    }
  end,
}
