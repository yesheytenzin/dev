-- Core config
require("config.lazy")
require("config.colors")
require("config.options")
require("config.keymaps")

-- Detect if inside tmux
local inside_tmux = os.getenv("TMUX") ~= nil

if inside_tmux then
  vim.opt.laststatus = 0   -- hide statusline in tmux
else
  vim.opt.laststatus = 3   -- global statusline outside tmux
  require("config.lualine")
end

