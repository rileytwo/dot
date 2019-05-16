-- This is a configuration for Hammerspoon:
-- Modification Keys: Cmd + Ctrl + Alt + Shift (⌘ + ⌃ + ⌥ + ⇧)
-- Karabiner-elements is used to bind Caps Lock to Modification Keys
-- Caps Lock (⇪) -> Cmd + Ctrl + Alt + Shift (⌘ + ⌃ + ⌥ + ⇧)
-- 1. Currently support window layout management:
--   -  ⌘ + ⌃ + ⌥ + ⇧ + [, Toggle current window to left/restore;
--   -  ⌘ + ⌃ + ⌥ + ⇧ + ], Toggle current window to right/restore;
--   -  ⌘ + ⌃ + ⌥ + ⇧ + M, Toggle current window to maximize/restore;

-- 1. --
hs.alert("Configuration loaded.")

hs.console.darkMode(true)

hs.window.animationDuration = 0
previous_frame_sizes = {}
modification_keys = {"cmd", "ctrl", "alt", "shift"}

hs.hotkey.bind(modification_keys, "R", function()
	hs.reload()
end)

hs.hotkey.bind(modification_keys, "W", function()
	hs.alert.show("Hello world!")
end)

function is_almost_equal_to_win_frame(geo)
	local epsilon = 2
	local c_win = hs.window.focusedWindow()
	local c_win_frame = c_win:frame()
	if  math.abs(c_win_frame.x - geo.x) < epsilon and
	math.abs(c_win_frame.y - geo.y) < epsilon and
	math.abs(c_win_frame.w - geo.w) < epsilon and
	math.abs(c_win_frame.h - geo.h) < epsilon then
		return true
	else
		return false
	end
end

function get_max_win_frame()
	local c_win = hs.window.focusedWindow()
	return c_win:screen():frame()
end

function get_fill_left_win_frame()
	local c_win = hs.window.focusedWindow()
	local c_win_frame = c_win:frame()
	local max_frame = c_win:screen():frame()
	c_win_frame.x = max_frame.x
	c_win_frame.y = max_frame.y
	c_win_frame.w = max_frame.w / 2
	c_win_frame.h = max_frame.h
	return c_win_frame
end

function get_fill_right_win_frame()
	local c_win         = hs.window.focusedWindow()
	local c_win_frame   = c_win:frame()
	local max_frame     = c_win:screen():frame()
	c_win_frame.x = max_frame.x + max_frame.w / 2
	c_win_frame.y = max_frame.y
	c_win_frame.w = max_frame.w / 2
	c_win_frame.h = max_frame.h
	return c_win_frame
end

function is_predefined_win_frame_size()
	if is_almost_equal_to_win_frame(get_max_win_frame()) or
	is_almost_equal_to_win_frame(get_fill_left_win_frame()) or
	is_almost_equal_to_win_frame(get_fill_right_win_frame()) then
		return true
	else
		return false
	end
end

function bind_resize_and_restore_keys(key, resize_frame_fn)
	hs.hotkey.bind(modification_keys, key, function()
		local c_win       = hs.window.focusedWindow()
		local c_win_frame = c_win:frame()
		local targetFrame = resize_frame_fn()
		
		if is_predefined_win_frame_size() and
		not is_almost_equal_to_win_frame(targetFrame) then
			c_win:setFrame(targetFrame)
		elseif previous_frame_sizes[c_win:id()] then
			c_win:setFrame(previous_frame_sizes[c_win:id()])
			previous_frame_sizes[c_win:id()] = nil
		else
			previous_frame_sizes[c_win:id()] = c_win_frame
			c_win:setFrame(targetFrame)
		end
	end)
end

bind_resize_and_restore_keys("M", get_max_win_frame)
bind_resize_and_restore_keys("[", get_fill_left_win_frame)
bind_resize_and_restore_keys("]", get_fill_right_win_frame)


-- 2. --

function is_right()
	local c_win        = hs.window.focusedWindow()
	local c_win_frame  = c_win:frame()
	local c_win_screen = c_win:screen()
	local max_frame    = c_win_screen:frame()
	
	if (c_win_frame.x + c_win_frame.w) == max_frame.w then
		return true
	else
		return false
	end
end

function is_top()
	local c_win        = hs.window.focusedWindow()
	local c_win_frame  = c_win:frame()
	local c_win_screen = c_win:screen()
	local max_frame    = c_win_screen:frame()
	
	--if math.abs(c_win_frame.y + c_win_frame.h) >= max_frame.h then
	if (c_win_frame.y + c_win_frame.h) <= (max_frame.h / 2) then
		return true
	else
		return false
	end
end

hs.hotkey.bind(modification_keys, "H", function()
	-- increase window width
	local c_win        = hs.window.focusedWindow()
	local c_win_frame  = c_win:frame()
	local c_win_screen = c_win:screen()
	local max_frame    = c_win_screen:frame()
	
	if is_right() and c_win_frame.x >= 0 then
		c_win_frame.x = c_win_frame.x - 50
		c_win_frame.w = c_win_frame.w + 50
		c_win:setFrame(c_win_frame)
	elseif c_win_frame.x < 0 or c_win_frame.w > max_frame.w then
		c_win_frame.x = 0
		c_win_frame.w = max_frame.w
		c_win:setFrame(c_win_frame)
	else
		c_win_frame.w = c_win_frame.w + 50
		c_win:setFrame(c_win_frame)
	end
end)

hs.hotkey.bind(modification_keys, "L", function()
	-- decrease window width
	local c_win = hs.window.focusedWindow()
	local c_win_frame = c_win:frame()
	
	if is_right() then
		c_win_frame.x = c_win_frame.x + 50
		c_win_frame.w = c_win_frame.w - 50
		c_win:setFrame(c_win_frame)
	else
		c_win_frame.w = c_win_frame.w - 50
		c_win:setFrame(c_win_frame)
	end
end)


hs.hotkey.bind(modification_keys, "K", function()
	-- increase window height
	local c_win = hs.window.focusedWindow()
	local c_win_frame = c_win:frame()
	
	if is_top() then
		c_win_frame.h = c_win_frame.h + 50
		c_win:setFrame(c_win_frame)
	else
		c_win_frame.y = c_win_frame.y - 50
		c_win_frame.h = c_win_frame.h + 50
		c_win:setFrame(c_win_frame)
	end
end)



hs.hotkey.bind(modification_keys, "J", function()
	-- decrease window height
	local c_win        = hs.window.focusedWindow()
	local c_win_frame  = c_win:frame()
	local c_win_screen = c_win:screen()
	local max_frame    = c_win_screen:frame()
	
	if is_top() then
		c_win_frame.h = c_win_frame.h - 50
		c_win:setFrame(c_win_frame)
	else
		c_win_frame.y = c_win_frame.y + 50
		c_win_frame.h = c_win_frame.h - 50
		c_win:setFrame(c_win_frame)
	end
end)
