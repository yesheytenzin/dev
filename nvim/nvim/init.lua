-- Core config
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.diagnostics")

-- Load colors after plugins are initialized
-- Use VimEnter to ensure all plugins are loaded first
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.colors")
  end,
})
-- Detect if inside tmux
-- local inside_tmux = os.getenv("TMUX") ~= nil

-- if inside_tmux then
  -- vim.opt.laststatus = 0   -- hide statusline in tmux
-- else
  -- vim.opt.laststatus = 3   -- global statusline outside tmux
  -- require("config.lualine")
-- end

