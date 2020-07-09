 --------------------------------------------------------------------[[
--[[

remap.lua

Used to remap keys in the event Karabiner-Elements is not working.
Original code inspired from https://youtu.be/wpVNm8Ub-1s, from
https://github.com/elliotwaite.

--]]
--------------------------------------------------------------------]]
ORDERED_KEY_CODES = {58, 61, 55, 54, 59, 62, 56, 60}
KEY_CODE_TO_KEY_STR = {
  [58] = 'leftAlt',
  [61] = 'rightAlt',
  [55] = 'leftCmd',
  [54] = 'rightCmd',
  [59] = 'leftCtrl',
  [62] = 'rightCtrl',
  [56] = 'leftShift',
  [60] = 'rightShift',
}
KEY_CODE_TO_MOD_TYPE = {
  [58] = 'alt',
  [61] = 'alt',
  [55] = 'cmd',
  [54] = 'cmd',
  [59] = 'ctrl',
  [62] = 'ctrl',
  [56] = 'shift',
  [60] = 'shift',
}
KEY_CODE_TO_SIBLING_KEY_CODE = {
  [58] = 61,
  [61] = 58,
  [55] = 54,
  [54] = 55,
  [59] = 62,
  [62] = 59,
  [56] = 60,
  [60] = 56,
}

KEYMAP = {
   {'rightCtrl', 'w', nil, 'up'},
   {'rightCtrl', 'a', nil, 'left'},
   {'rightCtrl', 's', nil, 'down'},
   {'rightCtrl', 'd', nil, 'right'},

   {'rightCtrl+shift', 'a', 'alt', 'left'},
   {'rightCtrl+shift', 'd', 'alt', 'right'},
}

hotkeyGroups = {}
for _, hotkeyVals in ipairs(KEYMAP) do
   local fromMods, fromKey, toMods, toKey = table.unpack(hotkeyVals)
   local toKeyStroke = function()
      hs.eventtap.keyStroke(toMods, toKey, 0)
   end
   local hotkey = hs.hotkey.new(fromMods, fromKey, toKeyStroke, nil, toKeyStroke)
   if hotkeyGroups[fromMods] == nil then
      hotkeyGroups[fromMods] = {}
   end
   table.insert(hotkeyGroups[fromMods], hotkey)
end

function updateEnabledHotkeys()
   if curHotkeyGroup ~= nil then
      for _, hotkey in ipairs(curHotkeyGroup) do
         hotkey:disable()
      end
   end

   local curModKeysStr = ''
   for _, keyCode in ipairs(ORDERED_KEY_CODES) do
      if modStates[keyCode] then
         if curModKeysStr ~= '' then
            curModKeysStr = curModKeysStr .. '+'
         end
         curModKeysStr = curModKeysStr .. KEY_CODE_TO_KEY_STR[keyCode]
      end
   end

   curHotkeyGroup = hotkeyGroups[curModKeysStr]
   if curHotkeyGroup ~= nil then
      for _, hotkey in ipairs(curHotkeyGroup) do
         hotkey:enable()
      end
   end
end

modKeyWatcher = hs.eventtap.new({hs.eventtap.event.types.flagsChanged}, function(event)
   local keyCode = event:getKeyCode()
   if modStates[keyCode] ~= nil then
     if event:getFlags()[KEY_CODE_TO_MOD_TYPE[keyCode]] then
       -- If a mod key of this type is currently pressed, we can't
       -- determine if this event was a key-up or key-down event, so we
       -- just toggle the `modState` value corresponding to the event's
       -- key code.
       modStates[keyCode] = not modStates[keyCode]
     else
       -- If no mod keys of this type are pressed, we know that this was
       -- a key-up event, so we set the `modState` value corresponding to
       -- this key code to false. We also set the `modState` value
       -- corresponding to its sibling key code (e.g. the sibling of left
       -- shift is right shift) to false to ensure that the state for
       -- that key is correct as well. This code makes the `modState`
       -- self correcting. If it ever gets in an incorrect state, which
       -- could happend if some other code triggers multiple key-down
       -- events for a single modifier key, the state will self correct
       -- once all modifier keys of that type are released.
       modStates[keyCode] = false
       modStates[KEY_CODE_TO_SIBLING_KEY_CODE[keyCode]] = false
     end
     updateEnabledHotkeys()
   end
 end):start()