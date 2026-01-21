---@diagnostic disable: lowercase-global
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local vars = require("main.user_variable")
local configpath = vars.configpath

gears.debug.dump(configpath)

require("main.error")

beautiful.maximized_hide_border = true
beautiful.init(configpath .. "awesome/theme.lua")

-- local vars = require("main.user_variable")
-- local modkey = vars.modkey
-- local terminal = vars.terminal
-- local editor = vars.editor
local layout = require("main.layout")
awful.layout.layouts = layout
-- Keyboard map indicator and switcher
require("main.tag")
require("appearance.wibox")

local globalbuttons = require("key.globalbuttons")
local globalkeys = require("key.globalkey")
root.buttons(globalbuttons)
root.keys(globalkeys)

local myrules = require("main.rule")
awful.rules.rules = myrules
require("main.signals")
require("module.autostart")
