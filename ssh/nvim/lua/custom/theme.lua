local M = {}

local state_file = vim.fn.expand("~/.local/state/omarchy/current/theme/neovim.lua")
local fallback = "tokyonight-night"

local function omarchy_colorscheme()
  if vim.fn.filereadable(state_file) ~= 1 then
    return nil
  end
  local ok, specs = pcall(dofile, state_file)
  if not ok or type(specs) ~= "table" then
    return nil
  end
  for _, spec in ipairs(specs) do
    if spec[1] == "LazyVim/LazyVim" and type(spec.opts) == "table" and type(spec.opts.colorscheme) == "string" then
      return spec.opts.colorscheme
    end
  end
  return nil
end

function M.apply()
  local name = omarchy_colorscheme() or fallback
  local ok = pcall(vim.cmd.colorscheme, name)
  if not ok and name ~= fallback then
    pcall(vim.cmd.colorscheme, fallback)
  end
  vim.cmd("redraw!")
end

function M.reload()
  M.apply()
end

local styles = { "night", "moon", "storm", "day" }

function M.cycle()
  local name = vim.g.colors_name or fallback
  local index = 0
  for i, style in ipairs(styles) do
    if name == "tokyonight-" .. style then
      index = i
      break
    end
  end
  local next_style = index == 0 and "night" or styles[index % #styles + 1]
  pcall(vim.cmd.colorscheme, "tokyonight-" .. next_style)
  vim.cmd("redraw!")
end

vim.keymap.set("n", "<leader>tt", M.cycle, { desc = "Cycle tokyonight style" })

return M
