local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local tag = { " \u{f120} ", " \u{f0ac} ", " obs ", " tel ", " \u{f121} ", " anki ", "7", "8", "9" }
awful.screen.connect_for_each_screen(function(s)
	awful.tag(tag, s, awful.layout.layouts[1])
end)
