module(..., package.seeall);
require 'clone'

monster = clone.object:clone()
monster.health = 100

-- beasty types you'll encounter
flying = monster:clone()
ground = monster:clone()

-- ground types
mole = ground:clone()
mole.name = 'Mole'
zombie = ground:clone()
zombie.name = 'Zombie'

-- flying types
swallow = flying:clone()
swallow.name = 'Swallow'
seagull = flying:clone()
seagull.name = 'Seagull'

-- other players (opponent is its own type)
opponent = monster:clone()
opponent.name = 'Opponent'
