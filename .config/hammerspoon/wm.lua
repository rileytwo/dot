--------------------------------------------------------------------[[
--[[

wm.lua

Window Management Functions

1: Layout
   -  ⌘ + ⌃ + ⌥ + ⇧ + [,    Toggle current window to left/restore;
   -  ⌘ + ⌃ + ⌥ + ⇧ + ],    Toggle current window to right/restore;
   -  ⌘ + ⌃ + ⌥ + ⇧ + F,    Toggle current window to screen/restore;
2: Resizing
   -  ⌘ + ⌃ + ⌥ + ⇧ + H,    Increase window width;
   -  ⌘ + ⌃ + ⌥ + ⇧ + J,    Increase window height;
   -  ⌘ + ⌃ + ⌥ + ⇧ + L,    Decrease window width;
   -  ⌘ + ⌃ + ⌥ + ⇧ + K,    Decrease window height;
3: Shifting
   -  ⌘ + ⌃ + ⌥ + ⇧ + 8,    Move window up;
   -  ⌘ + ⌃ + ⌥ + ⇧ + I,    Move window down;
   -  ⌘ + ⌃ + ⌥ + ⇧ + U,    Move window left;
   -  ⌘ + ⌃ + ⌥ + ⇧ + O,    Move window right;

4: Screen Management
   - ⌘ + ⌃ + ⌥ + ⇧ + Left,  Move screen right;
   - ⌘ + ⌃ + ⌥ + ⇧ + Right, Move screen  left;

5: Key Binding Functions

6: Return wm

--]]
--------------------------------------------------------------------]]

local wm     = {}
local window = hs.window
window.animationDuration = 0.15

wm.history  = {}
wm.gap      = 5
wm.mod_keys = {"cmd", "ctrl", "alt", "shift"}
wm.screen   = {}

---[[ 1 ]]

function wm.fill_full()
	local gap          = wm.gap
	local win          = window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	win_frame.x = screen_frame.x + gap
	win_frame.y = screen_frame.y + gap
	win_frame.w = screen_frame.w - (gap * 2)
	win_frame.h = screen_frame.h - (gap * 2)

	return win_frame
end


function wm.fill_left()
	local gap          = wm.gap
	local win          = window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	win_frame.x = screen_frame.x + gap
	win_frame.y = screen_frame.y + gap
	win_frame.w = (0.5 * screen_frame.w) - (1.5 * gap)
	win_frame.h = screen_frame.h - (2 * gap)

	return win_frame
end


function wm.fill_right()
	local gap          = wm.gap
	local win          = window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

   win_frame.x = 0.5 * ((2 * screen_frame.x) + (screen_frame.w + gap))
	win_frame.y = screen_frame.y + gap
	win_frame.w = 0.5 * (screen_frame.w - (1.5 * gap))
	win_frame.h = screen_frame.h - (2 * gap)

	return win_frame
end


function wm.fill_center()
   local win          = window.focusedWindow()
   local win_frame    = win:frame()
   local screen_frame = win:screen():frame()

   win_frame.x = 0.5 * (screen_frame.w - win_frame.w) + screen_frame.x
   win_frame.y = 0.5 * (screen_frame.h - win_frame.h) + screen_frame.y

   return win_frame
end



---[[ 2 ]]

function wm.is_right_win_frame()
   local gap          = wm.gap
   local win          = hs.window.focusedWindow()
   local win_frame    = win:frame()
   local screen_frame = win:screen():frame()

	if (screen_frame.w - (win_frame.x + win_frame.w)) <= (gap * 10) then
		return true

	else
		return false
	end
end


function wm.inc_win_width()
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	if wm.is_right_win_frame() and win_frame.x >= 0 then
		win_frame.x = win_frame.x - 50
		win_frame.w = win_frame.w + 50
		win:setFrame(win_frame)

	elseif win_frame.w > screen_frame.w then
		win_frame.x = 0
		win_frame.w = screen_frame.w
		win:setFrame(win_frame)

	else
		win_frame.w = win_frame.w + 50
		win:setFrame(win_frame)
   end

   return win_frame
end


function wm.dec_win_width()
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	if wm.is_right_win_frame() then
		win_frame.w = win_frame.w - 50
		win_frame.x = win_frame.x + 50
		win:setFrame(win_frame)

	else
		win_frame.w = win_frame.w - 50
		win:setFrame(win_frame)
   end

   return win_frame
end


function wm.inc_win_height()
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.h = win_frame.h + 50
   win:setFrame(win_frame)

   return win_frame
end


function wm.dec_win_height()
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.h = win_frame.h - 50
   win:setFrame(win_frame)

   return win_frame
end



---[[ 3 ]]

function wm.shift_up()
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.y = win_frame.y - 50
   win:setFrame(win_frame)

   return win_frame
end


function wm.shift_down()
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.y = win_frame.y + 50
	win:setFrame(win_frame)

   return win_frame
end


function wm.shift_left()
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()

	win_frame.x = win_frame.x - 50
	win:setFrame(win_frame)

   return win_frame
end


function wm.shift_right()
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.x = win_frame.x + 50
	win:setFrame(win_frame)

   return win_frame
end


function wm.toggle_win_lr()
   local win          = hs.window.focusedWindow()
   local win_frame    = win:frame()
   local screen_frame = win:screen():frame()

   win_frame.x = (2 * screen_frame.x) +
                 (screen_frame.w - (win_frame.x + win_frame.w))
   win:setFrame(win_frame)

   return win_frame
end



---[[ 4 ]]

function wm.screen.north()
   local win = window.focusedWindow()
   local win_screen = win:screen()

   win:moveToScreen(win_screen:toNorth())
   return win
end


function wm.screen.south()
   local win = window.focusedWindow()
   local win_screen = win:screen()

   win:moveToScreen(win_screen:toSouth())
   return win
end


function wm.screen.east()
	local win        = window.focusedWindow()
	local win_screen = win:screen()

	win:moveToScreen(win_screen:toEast())
   return win_screen
end


function wm.screen.west()
	local win        = window.focusedWindow()
	local win_screen = win:screen()

	win:moveToScreen(
		win_screen:toWest()
	)
   return win_screen
end

---[[ 5 ]]



function wm.bind(key, resize_frame_fn, restorable)
   hs.hotkey.bind(wm.mod_keys, key,
      function()
         local win       = hs.window.focusedWindow()
         local win_frame = win:frame()
         local new_frame = resize_frame_fn()

         if restorable then
            if wm.history[win:id()] then
               win:setFrame(wm.history[win:id()])
               wm.history[win:id()] = nil
            else
               wm.history[win:id()] = win_frame
               win:setFrame(new_frame)
            end
         else
            win:setFrame(new_frame)
         end
      end
   )
end


function wm.screen.bind(key, screen_move_function, strict)
   hs.hotkey.bind(wm.mod_keys, key,
      function()
         local win        = hs.window.focusedWindow()
         local new_screen = screen_move_function()

         if strict then
            hs.screen.strictScreenInDirection = true
         end

         wm.history[win:id()] = nil
         return new_screen
      end
   )
end


---[[ 6 ]]

return wm