return {
  {
    "mfussenegger/nvim-dap",
    ft = { "c", "cpp" },
    config = function()
      require("config.debug")
    end,
  },
}
