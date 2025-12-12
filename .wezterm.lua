-- Pull in the wezterm Api
local wezterm = require("wezterm")

-- This will holg the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

-- keep adding configuration options here
--

-- tab bars
config.enable_tab_bar = false

config.default_prog = { "zellij" }
-- window bar
-- config.window_decorations = "RESIZE"
config.keys = {
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
}

-- opacity and blur
config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 90
-- config.window_background_image = '/home/alexandr/Documents/wallpapers/windows-11-stock-colorful-gradient-background-aesthetic-3840x2160-7024.jpg'

-- color scheme
config.color_scheme = "Catppuccin Macchiato (Gogh)"

return config
