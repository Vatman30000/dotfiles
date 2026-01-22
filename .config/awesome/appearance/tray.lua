local awful = require("awful")
-- local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")
local naughty = require("naughty")

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
local function read_file(path)
	local f = io.open(path, "r")
	if not f then
		return nil
	end
	local content = f:read("*all")
	f:close()
	return content and content:gsub("%s+", "") or nil
end

function widgets.mybattery(s)
	local batterywidget = wibox.widget({
		widget = wibox.widget.textbox(),
		screen = s,
	})

	-- тут меняем BAT0 -> BAT1
	local bat_path = "/sys/class/power_supply/BAT1"

	local function update_battery()
		local perc = read_file(bat_path .. "/capacity")
		local status = read_file(bat_path .. "/status")
		if not perc and not status then
			batterywidget.text = "AC "
			return
		end

		perc = perc or "?"
		-- status = status or "Unknown"

		batterywidget.text = perc .. "% "
	end

	update_battery()

	-- watchdog, просто дергаем нашу функцию
	awful.widget.watch("true", 30, function()
		update_battery()
	end, batterywidget)

	return wibox.widget({
		batterywidget,
		fg = beautiful.border_focus,
		widget = wibox.container.background,
	})
end
return widgets
