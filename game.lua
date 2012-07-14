require('data.lua')
require('state.lua')
require('utils.lua')
require('commands.lua')
require('events.lua')

local prompt = '> '

local state = State.new{location=data.start}

queue_event('init', state)

-- Game loop
while not data.quit do
    -- process the event loop
    process_events()

    -- process user input
    io.write(prompt)
    input = io.read('*line')
    cmd, params = utils.parse_input(input)
    cmdfunc = commands[cmd]
    if cmdfunc then cmdfunc(unpack(params)) end
end
