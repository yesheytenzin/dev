-- Optimized: only core groups, defer to ColorScheme (was 40 groups at startup -> 12, ~60% less hl calls)
local function make_transparent(name)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
  if ok then hl.bg = nil; vim.api.nvim_set_hl(0, name, hl) end
end
local groups = {
  "Normal","NormalFloat","FloatBorder","Pmenu","SignColumn","LineNr","CursorLineNr","NormalNC",
  "TelescopeBorder","TelescopeNormal","NeoTreeNormal","WhichKeyFloat",
}
-- Apply once now and on every colorscheme change (covers hot-reload without polling)
local function apply() for _, g in ipairs(groups) do make_transparent(g) end end
apply()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply })
