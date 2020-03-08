--------------------------------------------------------------------[[
--[[

init.lua

Hammerspoon config.
Original code inspired (and copied) from https://blog.igorw.org/.


Modifier Keys: Cmd + Ctrl + Alt + Shift (⌘ + ⌃ + ⌥ + ⇧)
Karabiner-elements is used to bind Caps Lock to Modifier Keys
Caps Lock (⇪) -> Cmd + Ctrl + Alt + Shift (⌘ + ⌃ + ⌥ + ⇧)

--]]
--------------------------------------------------------------------]]

modifier_keys = {"cmd", "ctrl", "alt", "shift"}
window_gap    = 5


local config = require("config")
local wm     = require("wm")


if modifier_keys then
   wm.mod_keys = modifier_keys
end

if window_gap then
   wm.gap = window_gap
end


hs.hotkey.bind(modifier_keys, "Y", function()
   hs.toggleConsole()
end)

hs.hotkey.bind(modifier_keys, "R", function()
	hs.notify.new({
		title           = "Hammerspoon",
		informativeText = "Config reloaded!"
	}):send()
	hs.reload()
end)


wm.bind("F", wm.fill_full, "restorable")
wm.bind("[", wm.fill_left, "restorable")
wm.bind("]", wm.fill_right, "restorable")
wm.bind("0", wm.fill_center, "restorable")
wm.bind("H", wm.increase_win_width)
wm.bind("L", wm.decrease_win_width)
wm.bind("J", wm.increase_win_height)
wm.bind("K", wm.decrease_win_height)
wm.bind("8", wm.shift_up)
wm.bind("I", wm.shift_down)
wm.bind("U", wm.shift_left)
wm.bind("O", wm.shift_right)
wm.bind("\\", wm.toggle_win_lr)
wm.screen.bind("Left", wm.screen.previous)
wm.screen.bind("Right", wm.screen.next)