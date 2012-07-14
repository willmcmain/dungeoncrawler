require("data.lua")
require("state.lua")
require("events.lua")

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

function commands.move(state, exit)
    queue_event('move', state, exit)
end

