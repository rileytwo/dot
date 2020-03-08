--------------------------------------------------------------------[[
--[[

config.lua

Hammerspoon preferences and configurations

--]]
--------------------------------------------------------------------]]

local config = {}

local console = hs.console

config.global = {}
config.global.console = {}


config.global.dark_mode = hs.preferencesDarkMode(true)


config.global.console.dark_mode = console.darkMode(true)
config.global.console.font      = console.consoleFont("SF Mono")
config.global.console.output_bg = console.outputBackgroundColor{
   alpha = 0.5
}
config.global.console.command_fg = console.consoleCommandColor{
   red   = 0.25,
   green = 0.70,
   blue  = 1.00
}
config.global.console.result_fg = console.consoleResultColor{
   red   = 0.98,
   green = 0.95,
   blue  = 0.64
}
config.global.console.print_fg = console.consolePrintColor{
   red   = 1.00,
   green = 1.00,
   blue  = 1.00
}

return config