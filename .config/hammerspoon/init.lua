--------------------------------------------------------------------[[
--[[
Hammerspoon config.
Original code inspired (and copied) from https://blog.igorw.org/.


Modification Keys: Cmd + Ctrl + Alt + Shift (⌘ + ⌃ + ⌥ + ⇧)
Karabiner-elements is used to bind Caps Lock to Modification Keys
Caps Lock (⇪) -> Cmd + Ctrl + Alt + Shift (⌘ + ⌃ + ⌥ + ⇧)


1: Window Layout Management
   -  ⌘ + ⌃ + ⌥ + ⇧ + [,    Toggle current window to left/restore;
   -  ⌘ + ⌃ + ⌥ + ⇧ + ],    Toggle current window to right/restore;
   -  ⌘ + ⌃ + ⌥ + ⇧ + F,    Toggle current window to screen/restore;

2: Window Resizing
   -  ⌘ + ⌃ + ⌥ + ⇧ + H,     Increase window width;
   -  ⌘ + ⌃ + ⌥ + ⇧ + J,     Increase window height;
   -  ⌘ + ⌃ + ⌥ + ⇧ + L,     Decrease window width;
   -  ⌘ + ⌃ + ⌥ + ⇧ + K,     Decrease window height;

3: Window Movement
   -  ⌘ + ⌃ + ⌥ + ⇧ + Left,  Move window to screen left;
   -  ⌘ + ⌃ + ⌥ + ⇧ + Right, Move window to screen right;
   -  ⌘ + ⌃ + ⌥ + ⇧ + 8,     Move window up;
   -  ⌘ + ⌃ + ⌥ + ⇧ + I,     Move window down;
   -  ⌘ + ⌃ + ⌥ + ⇧ + U,     Move window left;
   -  ⌘ + ⌃ + ⌥ + ⇧ + O,     Move window right;


4: Put it all together

--]]
--------------------------------------------------------------------]]


--[[ 0 -------------------------------------------------------------]]
hs.preferencesDarkMode(true)
hs.console.consoleFont("SFL Mono")
hs.console.darkMode(true)

if hs.console.darkMode(true) then
	hs.console.outputBackgroundColor{alpha = 0.5}
	hs.console.consoleCommandColor{
		red = 0.25, blue = 1, green = 0.7
	}
	hs.console.consoleResultColor{
		red = 0.2, blue = 0.2, green = 0.9
	}
	hs.console.consolePrintColor{
		red = 0.9, blue = 0.1, green = 0.9
	}
end



--[[ 1 -------------------------------------------------------------]]
hs.window.animationDuration = 0.20
mod_keys                    = {"cmd", "ctrl", "alt", "shift"}
prev_frame_sizes        = {}

hs.hotkey.bind(mod_keys, "Y", function()
	hs.toggleConsole()
end)

hs.hotkey.bind(mod_keys, "R", function()
	hs.notify.new({
		title           = "Hammerspoon",
		informativeText = "Config reloaded!"
	}):send()
	hs.reload()
end)


function fill_full()
	local gap          = 5
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	win_frame.x = screen_frame.x + gap
	win_frame.y = screen_frame.y + gap
	win_frame.w = screen_frame.w - (gap * 2)
	win_frame.h = screen_frame.h - (gap * 2)

	return win_frame
end


function fill_left()
	local gap          = 5
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	win_frame.x = screen_frame.x + gap
	win_frame.y = screen_frame.y + gap
	win_frame.w = (screen_frame.w / 2) - (gap * 1.5)
	win_frame.h = screen_frame.h - (gap * 2)

	return win_frame
end


function fill_right()
	local gap          = 5
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	if screen_frame.x < 0 then
		win_frame.x = (screen_frame.w + gap) / -2
	else
		win_frame.x = (screen_frame.w + gap) / 2
	end
	win_frame.y = screen_frame.y + gap
	win_frame.w = (screen_frame.w / 2) - (gap * 1.5)
	win_frame.h = screen_frame.h - (gap * 2)

	return win_frame
end

function fill_center()
   local win          = hs.window.focusedWindow()
   local win_frame    = win:frame()
   local screen_frame = win:screen():frame()

   win_frame.x = (screen_frame.w - win_frame.w) / 2
   win_frame.y = (screen_frame.h - win_frame.h) / 2

   return win_frame
end


function is_almost_equal_to_win_frame(geo)
	local epsilon   = 5
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	if math.abs(win_frame.x - geo.x) < epsilon and
      math.abs(win_frame.y - geo.y) < epsilon and
      math.abs(win_frame.w - geo.w) < epsilon and
      math.abs(win_frame.h - geo.h) < epsilon then
      return true

	else
		return false
	end
end


function is_predefined_win_frame_size()
	if is_almost_equal_to_win_frame(fill_full())   or
      is_almost_equal_to_win_frame(fill_left())   or
      is_almost_equal_to_win_frame(fill_center()) or
		is_almost_equal_to_win_frame(fill_right())  then
		return true

	else
		return false
	end
end


function bind_resize_restore(key, resize_frame_fn)
	hs.hotkey.bind(mod_keys, key,
		function()
			local win          = hs.window.focusedWindow()
			local win_frame    = win:frame()
			local target_frame = resize_frame_fn()

			if is_predefined_win_frame_size() and not
				is_almost_equal_to_win_frame(target_frame) then
				win:setFrame(target_frame)

			elseif prev_frame_sizes[win:id()] then
				win:setFrame(prev_frame_sizes[win:id()])
				prev_frame_sizes[win:id()] = nil

			else
				prev_frame_sizes[win:id()] = win_frame
				win:setFrame(target_frame)
			end
		end
	)
end


bind_resize_restore("F", fill_full)
bind_resize_restore("[", fill_left)
bind_resize_restore("]", fill_right)
bind_resize_restore("0", fill_center)


--[[ 2 -------------------------------------------------------------]]
function is_right_win_frame()
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	if (screen_frame.w - (win_frame.x + win_frame.w)) <= 50 then
		return true

	else
		return false
	end
end


function push_left_west()
	-- push western frame west (increases window width)
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()
	local screen_frame = win:screen():frame()

	if is_right_win_frame() and win_frame.x >= 0 then
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


function pull_right_east()
	-- pull western frame east (decreases window width)
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	if is_right_win_frame() then
		win_frame.w = win_frame.w - 50
		win_frame.x = win_frame.x + 50
		win:setFrame(win_frame)

	else
		win_frame.w = win_frame.w - 50
		win:setFrame(win_frame)
   end

   return win_frame
end


function push_bottom_south()
	-- push southern frame south (increases window height)
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.h = win_frame.h + 50
   win:setFrame(win_frame)

   return win_frame
end


function pull_bottom_north()
	-- pull southern frame north (decreases window height)
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.h = win_frame.h - 50
   win:setFrame(win_frame)

   return win_frame
end



--[[ 3 -------------------------------------------------------------]]

function move_up()
	--	move window up
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.y = win_frame.y - 50
   win:setFrame(win_frame)

   return win_frame
end


function move_down()
	--	move window down
	local win       = hs.window.focusedWindow()
	local win_frame = win:frame()

	win_frame.y = win_frame.y + 50
	win:setFrame(win_frame)

   return win_frame
end


function move_left()
	--	move window left
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()

	win_frame.x = win_frame.x - 50
	win:setFrame(win_frame)

   return win_frame
end


function move_right()
	--	move window right
	local win          = hs.window.focusedWindow()
	local win_frame    = win:frame()

	win_frame.x = win_frame.x + 50
	win:setFrame(win_frame)

   return win_frame
end


function move_screen_right()
	-- move to screen right
	--   wraps around to first screen
	local win        = hs.window.focusedWindow()
	local win_screen = win:screen()

	win:moveToScreen(
		win_screen:next(),
		{"noResize"},
		{"ensureInScreenBounds"}
	)

   return win_screen
end


function move_screen_left()
	-- move to screen left
	--   wraps around to last screen
	local win        = hs.window.focusedWindow()
	local win_screen = win:screen()

	win:moveToScreen(
		win_screen:previous(),
		{"noResize"},
		{"ensureInScreenBounds"}
	)

   return win_screen
end



--[[ 4 -------------------------------------------------------------]]
function bind_win_manager(key, resize_frame_fn)
	hs.hotkey.bind(mod_keys, key,
		function()
			local win          = hs.window.focusedWindow()
--			local win_frame    = win:frame()
--			local screen_frame = win:screen():frame()
			local new_frame    = resize_frame_fn()

			win:setFrame(new_frame)

		end
	)
end


bind_win_manager("H", push_left_west)
bind_win_manager("L", pull_right_east)
bind_win_manager("J", push_bottom_south)
bind_win_manager("K", pull_bottom_north)
bind_win_manager("8", move_up)
bind_win_manager("I", move_down)
bind_win_manager("U", move_left)
bind_win_manager("O", move_right)
bind_win_manager("Left", move_screen_left)
bind_win_manager("Right", move_screen_right)
