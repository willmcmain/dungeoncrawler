-- rooms
Room{
    id = 1,
    description = [[A large room]],
    exits = {
        north = 2,
        west = 3,
    },
}

Room{
    id = 2,
    description = [[Another large room]],
    exits = {
        south = 1,
    }
}

Room{
    id = 3,
    description = [[A small room]],
    exits = {
        east = 1,
    }
}

Start(1)
