events = {}
local queue = {}

function queue_event(name, ...)
    local func = events[name]

    if func then
        table.insert(queue, function () func(unpack(arg)) end)
    end
end

function process_events()
    while table.getn(queue) > 0 do
        local func = table.remove(queue, 1)
        func()
    end
end

function events.init(state)
    queue_event('room_description', state)
end

function events.room_description(state)
    local room = data.rooms[state.location]
    print(room.description)
    io.write('exits: ')

    local first = true
    for ex in pairs(room.exits) do
        if first then 
            first = false 
        else
            io.write(', ')
        end
        io.write(ex)
    end
    io.write('\n')
end

function events.move(state, exit)
    local room = data.rooms[state.location] 
    local next_room = room.exits[exit]
    if not next_room then 
        print("can't go that way!")
        return 
    end

    state.location = next_room
    queue_event('room_description', state)
end
