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
-- ====== ВИДЖЕТ СЕТИ ======
-- подставь реальные интерфейсы
local WIFI_IF = "wlp2s0"
local ETH_IF = "enp3s0"

local function parse_nmcli()
	-- nmcli d: STATE column: connected/disconnected/unavailable и TYPE: wifi/ethernet [web:99][web:102]
	local handle = io.popen("nmcli -t -f DEVICE,TYPE,STATE d 2>/dev/null")
	if not handle then
		return nil
	end
	local out = handle:read("*all") or ""
	handle:close()

	local active_type = nil
	for line in out:gmatch("[^\n]+") do
		-- формат: DEVICE:TYPE:STATE
		local dev, tp, state = line:match("([^:]+):([^:]+):([^:]+)")
		if dev and tp and state then
			if state == "connected" then
				-- запоминаем приоритет: сначала ethernet, потом wifi
				if tp == "ethernet" then
					active_type = "eth"
					break
				elseif tp == "wifi" and active_type ~= "eth" then
					active_type = "wifi"
				end
			end
		end
	end

	return active_type
end

function widgets.mynetwork(s)
	local netwidget = wibox.widget({
		widget = wibox.widget.textbox(),
		screen = s,
	})

	local function update_net()
		local t = parse_nmcli()
		-- можно заменить на иконки из nerd‑font/awesome‑font
		if t == "eth" then
			netwidget.text = "󰈀 " -- ethernet icon (если есть nerd font)
		elseif t == "wifi" then
			netwidget.text = "󰤨 " -- wifi icon
		else
			netwidget.text = "󰖪 " -- нет сети / оффлайн
		end
	end

	update_net()

	-- обновляем каждые 5 секунд
	awful.widget.watch("nmcli -t -f DEVICE,TYPE,STATE d", 5, function()
		update_net()
	end, netwidget)

	return wibox.widget({
		netwidget,
		fg = beautiful.border_focus,
		widget = wibox.container.background,
	})
end
return widgets
