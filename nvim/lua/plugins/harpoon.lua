return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ha", function() local h=require("harpoon"); if h:list():length()<4 then h:list():add() else vim.notify("Harpoon full (4 max)", vim.log.levels.WARN) end end, desc = "Harpoon add" },
    { "<leader>hm", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },
    { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
    { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
    { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
    { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
    { "<leader>hc", function() require("harpoon"):list():clear() end, desc = "Harpoon clear" },
  },
}
