local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local tag = { "1-term", "2-zen", "3-obs", "4-tel", "5-code", "6-anki", "7", "8", "9" }
awful.screen.connect_for_each_screen(function(s)
	awful.tag(tag, s, awful.layout.layouts[1])
end)
