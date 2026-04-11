if not vim.g.neovide then
  return
end

-- =========================
-- Neovide configuration
-- =========================

-- Font
vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-- Scale
vim.g.neovide_scale_factor = 1.0

-- Smooth scrolling
vim.g.neovide_scroll_animation_length = 0.25

-- Cursor animation (movement smoothing)
vim.g.neovide_cursor_animation_length = 0.2
vim.g.neovide_cursor_trail_size = 1.0
vim.g.neovide_cursor_antialiasing = true

-- Cursor VFX (VERY visible)
vim.g.neovide_cursor_vfx_mode = "sonicboom"
vim.g.neovide_cursor_vfx_particle_density = 10.0
vim.g.neovide_cursor_vfx_particle_lifetime = 2.0

-- Transparency
vim.g.neovide_transparency = 0.92
vim.g.neovide_background_color = "#0f1117"

-- Padding
vim.g.neovide_padding_top = 10
vim.g.neovide_padding_bottom = 10
vim.g.neovide_padding_left = 10
vim.g.neovide_padding_right = 10

-- Window behavior
vim.g.neovide_remember_window_size = true

