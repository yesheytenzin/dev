-- ~/.config/nvim/lua/plugins/neovide.lua

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h12"

  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 0.95

  vim.g.neovide_padding_top = 8
  vim.g.neovide_padding_bottom = 8
  vim.g.neovide_padding_left = 8
  vim.g.neovide_padding_right = 8

  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_refresh_rate_idle = 30

  vim.g.neovide_cursor_animation_length = 0.08
  vim.g.neovide_cursor_trail_size = 0.4

  vim.g.neovide_scroll_animation_length = 0.15

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_confirm_quit = true

  vim.g.neovide_cursor_vfx_mode = ""
end
