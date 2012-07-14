require("data.lua")

local mt = {}
mt.__index = function(table, key)
    return table['default']
end

commands = {}
setmetatable(commands, mt)

function commands.quit()
    data.quit = true
end

function commands.default()
    print("command not recognized!")
end
