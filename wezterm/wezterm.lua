local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.color_scheme = "OneHalfDark"
config.default_prog = { "/opt/homebrew/bin/fish" }
config.font = wezterm.font("Inconsolata Nerd Font")
config.font_size = 17

wezterm.on("gui-startup", function(cmd)
        local _, _, window = mux.spawn_window(cmd or {})
        window:gui_window():maximize()
end)


return config
