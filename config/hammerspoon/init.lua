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
local conf    = require("conf")
local wm      = require("wm")
local altdrag = require("altdrag")


altdrag.watcher:start()


modifier_keys = {"alt", "shift"}
window_gap    = 5

wm.mod_keys = modifier_keys or wm.mod_keys
wm.gap      = window_gap or wm.gap


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

wm.bind("L", wm.inc_win_width)
wm.bind("H", wm.dec_win_width)
wm.bind("J", wm.inc_win_height)
wm.bind("K", wm.dec_win_height)

wm.bind("8", wm.shift_up)
wm.bind("I", wm.shift_down)
wm.bind("U", wm.shift_left)
wm.bind("O", wm.shift_right)
wm.bind("\\", wm.toggle_win_lr)

wm.screen.bind("Up",    wm.screen.north, "strict")
wm.screen.bind("Down",  wm.screen.south, "strict")
wm.screen.bind("Right", wm.screen.east,  "strict")
wm.screen.bind("Left",  wm.screen.west,  "strict")


function check_karabiner()
   apps = hs.application.runningApplications()
   karabiner = "false"

   for _, app in ipairs(apps) do
      local appname = app:name()

      if appname == "karabiner_console_user_server" then
         print(appname .. " is running")
         karabiner = "true"
      return karabiner
      end
   end
end

if not check_karabiner() then
   local remap = require("remap")
   keymap = {
      {'rightCtrl', 'w', nil, 'up'},
      {'rightCtrl', 'a', nil, 'left'},
      {'rightCtrl', 's', nil, 'down'},
      {'rightCtrl', 'd', nil, 'right'},

      {'rightCtrl+rightShift', 'a', 'alt', 'left'},
      {'rightCtrl+rightShift', 'd', 'alt', 'right'}
   }
   remap.KEYMAP = keymap or remap.KEYMAP
   remap.mod_key_watcher:start()

   hs.hotkey.bind({"ctrl"}, "delete", nil,
   function()
      hs.eventtap.keyStroke({"alt"}, "delete", 0)
   end)
end