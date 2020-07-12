--------------------------------------------------------------------[[
--[[

conf.lua

Hammerspoon preferences and configurations

--]]
--------------------------------------------------------------------]]

local conf = {}

hs.preferencesDarkMode(true)

hs.logger.defaultLogLevel = "error"

hs.console.darkMode(true)
hs.console.consoleFont({name="SF Mono", size=12})
hs.console.outputBackgroundColor{alpha = 0.5}

hs.console.consoleCommandColor{red = 0.25, green = 0.70, blue = 1.00}
hs.console.consoleResultColor{red = 0.98, green = 0.95, blue = 0.64}
hs.console.consolePrintColor{red = 1.00, green = 1.00, blue = 1.00}

return conf