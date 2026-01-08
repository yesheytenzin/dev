-- ~/.config/nvim/lua/plugins/lualine.lua
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- Minimal lualine setup for Option C
lualine.setup({
  options = {
    globalstatus = true,               -- one statusline for all windows
    theme = "auto",                    -- automatically match your colorscheme
    disabled_filetypes = { "NvimTree" }, -- hide statusline for NvimTree
  },
  sections = {
    lualine_a = { "mode" },            -- only show current mode
    lualine_b = {},                     -- empty
    lualine_c = { "filename" },        -- show filename in the middle
    lualine_x = {},                     -- empty
    lualine_y = {},                     -- empty
    lualine_z = {                       -- right section: 12-hour clock
      function()
        return os.date("%I:%M %p")
      end,
    },
  },
})

