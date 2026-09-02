local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Spawn a zsh shell in login mode
config.default_prog = { '/usr/bin/zsh', '-l' }

config.color_scheme = 'Ubuntu'
config.font_size = 12.0
config.font = wezterm.font 'UbuntuMono Nerd Font'
config.hide_tab_bar_if_only_one_tab = true

config.audible_bell = "Disabled"

local act = wezterm.action
config.keys = {
  -- CTRL+SHIFT+ALT+"  Split the pane vertically
  -- CTRL+SHIFT+ALT+%  Split the pane horizontally
  -- CTRL+SHIFT+Arrow Key  Move to an adjacent pane in that direction
  { key = 'h', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Left'), },
  { key = 'l', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Right'), },
  { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Down'), },
  { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection('Up'), },

  { key = '1', mods = 'ALT', action = act.ActivateTab(0), },
  { key = '2', mods = 'ALT', action = act.ActivateTab(1), },
  { key = '3', mods = 'ALT', action = act.ActivateTab(2), },
  { key = '4', mods = 'ALT', action = act.ActivateTab(3), },
  { key = '5', mods = 'ALT', action = act.ActivateTab(4), },
  { key = '6', mods = 'ALT', action = act.ActivateTab(5), },
  { key = '7', mods = 'ALT', action = act.ActivateTab(6), },
  { key = '8', mods = 'ALT', action = act.ActivateTab(7), },
  { key = '9', mods = 'ALT', action = act.ActivateTab(8), },
  { key = '0', mods = 'ALT', action = act.ActivateTab(9), },
}

local mux = wezterm.mux
wezterm.on('gui-startup', function()
  local tab, _, window = mux.spawn_window {}
  window:spawn_tab {
    cwd = '/home/jd-robotto/code/AIMBOT_Clean/',
  }
  local _, strike_pane, _ = window:spawn_tab {
    cwd = '/home/jd-robotto/code/',
  }
  window:gui_window():maximize()
  -- Delay the split calculations by 50ms so OS window scaling calculation finishes
  wezterm.sleep_ms(50)

  local ardupilot_pane = strike_pane:split {
    direction = 'Right',
    size = 0.4,
    cwd = '/home/jd-robotto/code/ardupilot/ArduPlane/',
    -- args = { 'source ~/venv-ardupilot/bin/activate' },
  }
  local screen_capture_pane = ardupilot_pane:split {
    cwd = '/home/jd-robotto/code/AIMBOT_Clean/tools/screen_capture/wayland/',
    direction = 'Bottom',
    size = 0.5,
  }
  local virtual_joystick_pane = screen_capture_pane:split {
    cwd = '/home/jd-robotto/code/AIMBOT_Clean/tools/virtual_joystick/',
    direction = 'Bottom',
    size = 0.5,
  }

  ardupilot_pane:send_text 'source ~/venv-ardupilot/bin/activate\n'
  screen_capture_pane:send_text 'uv run main.py --fullscreen'
  virtual_joystick_pane:send_text 'uv run main.py'

  tab:activate()
end)

return config
