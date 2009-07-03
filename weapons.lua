-- general weapon prototype
weapon = object:clone()
weapon.cost = 100

-- over-arching types
ranged = weapon:clone()
ranged.range = 4
melee = weapon:clone()
melee.range = 1

-- specific weapon prototypes
pistol = ranged:clone()
pistol.damage = 15
pistol.accuracy = 90

smg = ranged:clone()
smg.damage = 30
smg.accuracy = 75

shotgun = ranged:clone()
shotgun.damage = 45
shotgun.accuracy = 60

rifle = ranged:clone()
rifle.damage = 60
rifle.accuracy = 45

-- melee weapon prototypes
crowbar = melee:clone()
crowbar.damage = 45
crowbar.accuracy = 60

bat = melee:clone()
bat.damage = 60
bat.accuracy = 45

axe = melee:clone()
axe.damage = 75
axe.accuracy = 30

chainsaw = melee:clone()
chainsaw.damage = 90
chainsaw.accuracy = 15

