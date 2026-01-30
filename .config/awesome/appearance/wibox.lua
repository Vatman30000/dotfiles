local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local appearance = {
	mytaglist = require("appearance.taglist"),
	mytasklist = require("appearance.tasklist"),
	mywallpaper = require("appearance.wallpaper"),
	mytraywidgets = require("appearance.tray"),
}

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	appearance.mywallpaper(s)

	s.mywibox = awful.wibar({ position = "top", screen = s, height = 5 }) -- height in pixels
	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			appearance.mytaglist(s),
			s.mypromptbox,
		},
		appearance.mytasklist(s), -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			appearance.mytraywidgets.mynetwork(s),
			appearance.mytraywidgets.mybattery(s),
			appearance.mytraywidgets.myvolume(s),
			appearance.mytraywidgets.mykbdlayout(s),
			appearance.mytraywidgets.mytextclock(s),
			-- appearance.mytraywidgets.mysystray(s),
			wibox.container.margin(appearance.mytraywidgets.mysystray(s), 2, 2, 2, 2, 2, 2),
			s.mylayoutbox,
		},
	})
end)
