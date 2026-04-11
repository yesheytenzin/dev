return {
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      -- Smear / trail style (very close to Neovide defaults)
      smear_between_buffers = true,       -- animate when jumping between buffers/windows
      smear_between_windows = true,       -- animate across splits
      use_floating_windows = true,        -- use floating win for the trail (cleaner)
      legacy_computing_symbols = false,   -- better look if your font/terminal supports it

      -- Main animation feel (tweak these to match your Neovide taste)
      -- animation_interval = 15,            -- ms between updates (lower = smoother, but more CPU)
      max_time_interval = 300,            -- max ms for one full animation step

      -- Trail length & behavior
      -- max_length = 0.6,                   -- 0.0–1.0; higher = longer visible trail (Neovide-like ~0.5–0.8)
      -- slope = {                           -- controls acceleration/deceleration
        -- power = 2,
        -- min = 0.1,
        -- max = 0.7,
      -- },

      -- Cursor character rendering
      cursor_character = nil,             -- nil = use real cursor char
      cursor_color = nil,                 -- nil = use normal highlight

      -- Optional: disable in certain modes / filetypes if distracting
      disable_in_insert = false,
      disable_in_visual = false,
	  max_length = 0.75,          -- longer trail, very Neovide-ish
	  animation_interval = 10,    -- super smooth (but ~10-20% more CPU)
	  slope = { power = 1.5 },    -- softer easing

      -- Performance tweaks (important on lower-end machines)
      fps = 60,                           -- target fps
    },
  },
}
