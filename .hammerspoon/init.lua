-- This is a configuration for Hammerspoon:
-- Modification Keys: Cmd + Ctrl (⌃ + ⌥)
-- 1. Currently support window layout management:
--   -  ⌃ ⌥ + [, Toggle current window to left/restore;
--   -  ⌃ ⌥ + ], Toggle current window to right/restore;
--   -  ⌃ ⌥ + M, Toggle current window to maximize/restore;

-- 1. --
hs.window.animationDuration = 0
previousFrameSizes = {}
modificationKeys = {"ctrl", "alt"}

hs.hotkey.bind(modificationKeys, "T", function()
	local curWin = hs.window.focusedWindow()
	hs.alert.show(test[curWin.__tostring])
end)

hs.hotkey.bind(modificationKeys, "R", function()
	hs.reload()
	hs.notify.new({title="Hammerspoon", informativeText="Config Reloaded"}):send()
end)

function isAlmostEqualToCurWinFrame(geo)
	local epsilon = 5
	local curWin = hs.window.focusedWindow()
	local curWinFrame = curWin:frame()
	if  math.abs(curWinFrame.x - geo.x) < epsilon and
		math.abs(curWinFrame.y - geo.y) < epsilon and
		math.abs(curWinFrame.w - geo.w) < epsilon and
		math.abs(curWinFrame.h - geo.h) < epsilon then
		return true
	else
		return false
	end
end

function getMaxWinFrame()
	local curWin = hs.window.focusedWindow()
	return curWin:screen():frame()
end

function getFillLeftWinFrame()
	local curWin = hs.window.focusedWindow()
	local curWinFrame = curWin:frame()
	local maxFrame = curWin:screen():frame()
	curWinFrame.x = maxFrame.x
	curWinFrame.y = maxFrame.y
	curWinFrame.w = maxFrame.w / 2
	curWinFrame.h = maxFrame.h
	return curWinFrame
end

function getFillRightWinFrame()
	local curWin = hs.window.focusedWindow()
	local curWinFrame = curWin:frame()
	local maxFrame = curWin:screen():frame()
	curWinFrame.x = maxFrame.x + maxFrame.w / 2
	curWinFrame.y = maxFrame.y
	curWinFrame.w = maxFrame.w / 2
	curWinFrame.h = maxFrame.h
	return curWinFrame
end

function isPredefinedWinFrameSize()
	if isAlmostEqualToCurWinFrame(getMaxWinFrame()) or
		isAlmostEqualToCurWinFrame(getFillLeftWinFrame()) or
		isAlmostEqualToCurWinFrame(getFillRightWinFrame()) then
		return true
	else
		return false
	end
end

function bindResizeAndRestoreToKeys(key, resize_frame_fn)
	hs.hotkey.bind(modificationKeys, key, function()
		local curWin = hs.window.focusedWindow()
		local curWinFrame = curWin:frame()
		local targetFrame = resize_frame_fn()

		if isPredefinedWinFrameSize() and not isAlmostEqualToCurWinFrame(targetFrame) then
			curWin:setFrame(targetFrame)
		elseif previousFrameSizes[curWin:id()] then
			curWin:setFrame(previousFrameSizes[curWin:id()])
			previousFrameSizes[curWin:id()] = nil
		else
			previousFrameSizes[curWin:id()] = curWinFrame
			curWin:setFrame(targetFrame)
		end
	end)
end

bindResizeAndRestoreToKeys("M", getMaxWinFrame)
bindResizeAndRestoreToKeys("[", getFillLeftWinFrame)
bindResizeAndRestoreToKeys("]", getFillRightWinFrame)

-- 2. --
hs.hotkey.bind(modificationKeys, "H", function()
	-- move current window left
	local win = hs.window.focusedWindow()
	local f   = win:frame()

	f.x = f.x - 10
	win:setFrame(f)
end)

hs.hotkey.bind(modificationKeys, "K", function()
	-- move current window right
	local win = hs.window.focusedWindow()
	local f   = win:frame()

	f.x = f.x + 10
	win:setFrame(f)
end)

-- hs.hotkey.bind(modificationKeys, "J", function()
-- 	local win = hs.window.focusedWindow()
-- 	local f = win:frame()
-- 	local screen = win:screen()
-- 	local max = screen:frame()

-- 	f.x = max.x + 10
-- 	win:setFrame(f)
-- end)
