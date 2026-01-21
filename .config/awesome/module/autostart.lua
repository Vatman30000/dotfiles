local awful = require("awful")
local vars = require("main.user_variable")

local config_path = vars.config_path

-- Try to use combination of `.once` or `.with_shell` and see what sticks
--awful.spawn.with_shell("pidof kitty || kitty", false)
--awful.spawn.with_shell("pidof kitty || env GLFW_IM_MODULE=ibus "..home_path.."/.local/kitty.app/bin/kitty", false)
awful.spawn.with_shell("flatpak run io.github.jeffshee.Hidamari")
awful.spawn.with_shell("xcalib -c -a")
-- для 100% контраста
-- awful.spawn.with_shell("xcalib -gc 1.15 -b 10 -co 87 -a")
-- для 75% контраста
awful.spawn.with_shell("xcalib -gc 1.15 -b 20 -co 100 -a")
awful.spawn.with_shell("pidof wezterm || wezterm")
awful.spawn.with_shell("pidof zen || zen")
awful.spawn.with_shell("pidof code || code")
awful.spawn.with_shell("pidof obsidian || obsidian --no-sandbox", false) -- because obsidian is an exception
awful.spawn.with_shell("setxkbmap -layout us,ru -option grp:win_space_toggle")
awful.spawn.with_shell("pidof copyq || copyq")
-- awful.spawn.with_shell(
-- 	"sleep 10 && sudo openvpn --config ~/Yandex-Disk/vpn/new/other os/Austria, Graz S6.ovpn --daemon"
-- )
-- awful.spawn.with_shell(
-- 	"sleep 10 && sudo openvpn --config ~/Yandex-Disk/vpn/hideme_432198097975924\(1\)\ \(2\)/other\ os/Netherlands,\ Amsterdam\ S8.ovpn --daemon"
-- )
awful.spawn.with_shell("pidof picom || picom --config ~/.config/picom/picom.conf --inactive-dim 0.5 &")

-- Scripts
-- awful.spawn.once(config_path.."script/set_xkb_layout.sh")
