require('data.lua')
require('state.lua')
require('utils.lua')
require('commands.lua')

local prompt = '> '

local state = State.new{location=data.start}

-- Game loop
while not data.quit do
    -- process the event loop
    
    -- process user input
    io.write(prompt)
    input = io.read('*line')
    cmd, params = utils.parse_input(input)
    cmdfunc = commands[cmd]
    if cmdfunc then cmdfunc(unpack(params)) end
end
