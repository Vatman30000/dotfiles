local gears = require("gears")
local beautiful = require("beautiful")

local _M = {
	terminal = "wezterm",
	editor = "nvim",
	configpath = gears.filesystem.get_xdg_config_home(),
	modkey = "Mod4",
	dpi = beautiful.xresources.apply_dpi,
	homepath = os.getenv("HOME") .. "/",
}
return _M
