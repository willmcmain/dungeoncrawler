-- current game state
State = {
    location = 1,
}

function State.new(self, o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end
