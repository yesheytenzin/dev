-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Disable all Omarchy default bindings. Add your own in hypr/bindings.lua.
-- omarchy_default_bindings = false
--
-- Or disable only bindings for Omarchy's preinstalled apps/web apps while
-- keeping core window-manager bindings:
-- omarchy_preinstalled_bindings = false

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
-- Hybrid Intel + NVIDIA: Omarchy's defaults route VA-API and GLX to the NVIDIA
-- dGPU, which keeps it awake and makes every frame cross PCIe to the Intel-driven
-- panel (stutters badly on battery). Default apps to the Intel iGPU instead;
-- launch games/heavy apps on NVIDIA with `prime-run <app>`.
hl.env("LIBVA_DRIVER_NAME", "iHD")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "mesa")

require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Add any other personal Hyprland configuration below.
-- o.window("qemu", { workspace = "5" })

-- The leader/AI agent console (Super+`) is boxed into a narrower centered
-- panel by Omarchy's default scratchpad logic when it holds a single window.
-- Force it to always span the full screen width instead.
do
  local SCRATCHPAD = "special:scratchpad"

  local function widen(monitor)
    monitor = monitor or hl.get_active_monitor()
    if not monitor or not monitor.scale or monitor.scale <= 0 then
      return
    end

    local width, height = monitor.width, monitor.height
    if monitor.transform % 2 == 1 then
      width, height = height, width
    end

    local reserved = monitor.reserved
    height = height / monitor.scale - reserved.top - reserved.bottom

    local tall = math.floor(height * 0.5)

    hl.workspace_rule({
      workspace = SCRATCHPAD,
      gaps_in = 0,
      gaps_out = { top = 0, right = 0, bottom = math.floor(height - tall), left = 0 },
      no_border = true,
    })
    hl.exec_scheduled_prop_refresh_immediately()
  end

  local function console_monitor()
    local ws = hl.get_workspace(SCRATCHPAD)
    local mon = ws and ws.visible and ws.monitor
    if mon and mon.scale and mon.scale > 0 then
      return mon
    end
    return hl.get_active_monitor()
  end

  hl.on("monitor.layout_changed", function()
    widen(console_monitor())
  end)
  hl.on("monitor.focused", function()
    widen(console_monitor())
  end)
  hl.on("workspace.special_active", function(ws, mon)
    if ws and ws.name == SCRATCHPAD then
      widen(mon)
    end
  end)
  hl.on("workspace.move_to_monitor", function(ws, mon)
    if ws and ws.name == SCRATCHPAD then
      widen(mon)
    end
  end)
  hl.on("window.open", function()
    widen(console_monitor())
  end)
  hl.on("window.update_rules", function()
    widen(console_monitor())
  end)

  widen(console_monitor())
end
