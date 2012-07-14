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
    queue_event('room', state)
end

function events.room(state)
    local room = data.rooms[state.location]
    print(room.description)
end
