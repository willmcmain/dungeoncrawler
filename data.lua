data = {
    rooms = {},
    start = 1,
    quit = false,
}

function Room(room)
    data.rooms[room.id] = room
end

function Start(room_id)
    data.start = room_id
end

dofile('data/rooms.lua')
