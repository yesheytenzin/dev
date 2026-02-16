-- Read system theme from Omarchy
local function get_system_theme()
  local theme_file = vim.fn.expand("~/.config/omarchy/current/theme.name")
  local file = io.open(theme_file, "r")
  if file then
    local theme = file:read("*line")
    file:close()
    return theme
  end
  return nil
end

-- Map Omarchy themes to Neovim colorschemes
local theme_map = {
  ["rose-pine"] = "rose-pine",
  ["rose-pine-dark"] = "rose-pine",
  ["tokyo-night"] = "tokyonight",
  ["tokyoled"] = "tokyonight",
  ["catppuccin"] = "catppuccin",
  ["catppuccin-latte"] = "catppuccin-latte",
  ["nord"] = "nord",
  ["gruvbox"] = "gruvbox",
  ["kanagawa"] = "kanagawa",
  ["everforest"] = "everforest",
  ["osaka-jade"] = "kanagawa",  -- similar aesthetic
  ["ethereal"] = "rose-pine",   -- fallback
  ["hackerman"] = "tokyonight", -- dark theme fallback
  ["matte-black"] = "tokyonight", -- dark theme fallback
  ["ristretto"] = "everforest",  -- similar earthy tones
  ["flexoki-light"] = "flexoki-light",  -- light theme
  ["one-dark-pro"] = "onedark"
}

-- Apply theme based on system theme
local system_theme = get_system_theme()
local colorscheme = "rose-pine"  -- default fallback

if system_theme and theme_map[system_theme] then
  colorscheme = theme_map[system_theme]
end

vim.cmd.colorscheme(colorscheme)

-- Refresh lualine to match the new colorscheme
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
  -- Force lualine to reload with the new theme
  vim.defer_fn(function()
    lualine.setup({
      options = {
        theme = "auto",
        section_separators = "",
        component_separators = "",
        globalstatus = true,
      },
    })
  end, 50)
end

