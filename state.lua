-- Player object
Player = {}

function Player.new(self, o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

-- Character information
Character = {
    strength = 1,
    agility = 1,
    constitution = 1,
    intellect = 1,
    inventory = {}
}

function Character.new(self, o, ...)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    o:init(unpack(arg))
    return o
end

function Character.init(self)
    self.current_hp = self:hit_points()
end

function Character.melee_attack(self)
    return self.strength
end

function Character.melee_attack(self)
    return self.agility
end

function Character.hit_points(self)
    return 10 + self.constitution
end

-- Object for holding current game state
State = {
    player = Player:new()
}

function State.new(self, o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

