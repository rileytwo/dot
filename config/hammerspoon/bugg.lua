--------------------------------------------------------------------[[
--[[

debug.lua

--]]
--------------------------------------------------------------------]]
local bugg = {
   wins = {
      print = function()
         local windows = hs.window.orderedWindows()
         for _, win in ipairs(windows) do
            print(win)
         end
      end,
      printall = function()
         local windows = hs.window.allWindows()
         for _, win in ipairs(windows) do
            print(win)
         end
      end
   },
   usb = require("hs.usb"),
   p = require("hs.inspect")
}

return bugg