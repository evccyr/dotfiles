local wezterm = require("wezterm")
return {
  font_size = 12.0,
  color_scheme = 'Gruvbox light, medium (base16)',
  hide_tab_bar_if_only_one_tab = true,
  window_close_confirmation = "NeverPrompt",
  set_environment_variables = {
    TERM = 'wezterm',
  },
  default_prog = { 'fish' },
  -- TODO: Map Alt+V to copyMode
  keys = {
    { key = 'h', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
    { key = 'l', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
    { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentTab { confirm = false }, },
    { key = 't', mods = 'ALT', action = wezterm.action.SpawnTab 'CurrentPaneDomain', },
  },
}
