require("data.lua")
require("state.lua")
require("events.lua")

local alias = {
    exit = 'quit',
    go = 'move',
}

local mt = {}
mt.__index = function(table, key)
    if alias[key] and table[alias[key]] then 
        return table[alias[key]]
    end
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

