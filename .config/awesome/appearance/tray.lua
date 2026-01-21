local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local widgets = {}

local vars = require("main.user_variable")

local dpi = vars.dpi
beautiful.systray_icon_spacing = dpi(5)

function widgets.mytextclock(s)
	return wibox.widget({
		screen = s,
		widget = wibox.widget.textclock(),
	})
end

function widgets.mysystray(s)
	return wibox.widget({
		screen = s,
		widget = wibox.widget.systray(),
	})
end
function widgets.mykbdlayout(s)
	return wibox.widget({
		screen = s,
		widget = awful.widget.keyboardlayout(),
	})
end
function widgets.myvolume(s)
	local volumewidget = wibox.widget({
		widget = wibox.widget.textbox(),
		screen = s,
	})
	awesome.connect_signal("laptop::volume", function(percentage, status)
		volumewidget.text = status .. "-" .. percentage .. " "
	end)

	return wibox.widget({
		volumewidget,
		fg = beautiful.border_focus,
		widget = wibox.container.background,
	})
end
return widgets
