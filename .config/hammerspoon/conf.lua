--------------------------------------------------------------------[[
--[[

conf.lua

Hammerspoon preferences and configurations

--]]
--------------------------------------------------------------------]]

local conf = {}

local console = hs.console

conf.global = {}
conf.global.console = {}
conf.global.screen = {}

conf.global.dark_mode = hs.preferencesDarkMode(true)


conf.global.console.dark_mode = console.darkMode(true)
conf.global.console.font      = console.consoleFont("SF Mono")
conf.global.console.output_bg = console.outputBackgroundColor{
   alpha = 0.5
}
conf.global.console.command_fg = console.consoleCommandColor{
   red   = 0.25,
   green = 0.70,
   blue  = 1.00
}
conf.global.console.result_fg = console.consoleResultColor{
   red   = 0.98,
   green = 0.95,
   blue  = 0.64
}
conf.global.console.print_fg = console.consolePrintColor{
   red   = 1.00,
   green = 1.00,
   blue  = 1.00
}

return conf