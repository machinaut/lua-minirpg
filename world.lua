module(..., package.seeall);
require 'clone'
require 'player'
require 'monsters'

world = clone.object:clone()
function world:describe()
	print('You are at the ' .. self.name .. '.')
end
world.flee = function(fields)
	player.location = home
end
world.move = function(fields)
	if #fields ~= 2 or fields[2] == 'help' then
		print('Usage: move location')
	elseif world[fields[2]] == nil then
		print('Error: '..fields[2]..' not a valid location')
	elseif player.location == world[fields[2]] then
		print("Error: You're already at "..fields[2]..".")
	else
		print("Moving to "..fields[2].."...")
		player.location = world[fields[2]]
	end
end
world.drop = function(fields)
	print("Dropping " .. fields[2])
end
world.equip = function(fields)
	print("Equipping" .. fields[2])
end
world.whereami = function(fields)
	print('I am at the '..player.location.name..'.')
end
world.help = function(fields)
	print("Help with what?")
end

----------------------------------------------------------------------------
-- Safe Zones --
----------------------------------------------------------------------------

home = world:clone()
home.name = 'Home'

shop = world:clone()
shop.name = 'Shop'
shop.describe = function()
	print('You are at the Shop.')
	print('You have ' .. player.money .. ' monies.')
end

shop.buy = function(fields)
	local itemname = fields[2]
	local item = weapons[itemname]
	
	if #fields ~= 2 or fields[2] == 'help' then
		print('Usage: buy itemname')
		return
	end
	
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. ' not a valid weapon name.')
		return
	end
	
	if player.inventory[item] ~= nil then
		print('Error: You already have that item.')
		return
	elseif player.money < item.cost then
		print('Error: Not enough money for ' .. itemname .. '.')
		return
	else
		print('Buying ' .. itemname .. '...')
		player.money = player.money - item.cost
		player.inventory[item] = item
		return
	end
end

shop.sell = function(fields)
	local itemname = fields[2]
	local item = weapons[itemname]
	
	if #fields ~= 2 or fields[2] == 'help' then
		print('Usage: sell itemname')
		return
	end
	
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. ' not a valid weapon name.')
		return
	end
	
	if player.inventory[item] == nil then
		print('Error: You dont have that in your inventory.')
		return
	else
		print('Selling ' .. itemname .. '...')
		player.money = player.money + item.cost*.80
		player.inventory[item] = nil
	end
end

----------------------------------------------------------------------------
-- Combat Zones --
----------------------------------------------------------------------------

-- Generic Combat Zone -----------------------------------------------------

combat = world:clone()
combat.name = 'Combat Zone'
combat.enemy = monsters.opponent

-- Combat Commands --

combat.describe = function()
	print('You are at the ' .. player.location.name .. '.')
	print('There is a ' .. player.location.enemy.name .. ' here.')
end

combat.attack = function(fields)
	if #fields ~= 1 or fields[2] == 'help' then
		print('Usage: attack')
		return
	elseif player.location.enemy == nil then
		print("There's no one here to attack.")
		return
	else
		print("Attacking " .. player.location.enemy.name .. " ...")
		return
	end
end

combat.flee = function(fields)
	if #fields ~= 1 or fields[2] == 'help' then
		print('Usage: flee')
		return
	else
		print('Fleeing to home ...')
		player.location = home
	end
end

-- Specific Combat Zones ---------------------------------------------------

-- The Woods
forest = combat:clone()
forest.name = 'Forest'
forest.enemy = monsters.swallow

-- The Mountains
mountain = combat:clone()
mountain.name = 'Mountains'
mountain.enemy = monsters.mole

-- The Lake
lake = combat:clone()
lake.name = 'Lake'
lake.enemy = monsters.zombie

-- The Beach
beach = combat:clone()
beach.name = 'Beach'
beach.enemy = monsters.seagull

-- The Graveyard
graveyard = combat:clone()
graveyard.name = 'Graveyard'
graveyard.enemy = monsters.zombie

-- The Arena
arena = combat:clone()
arena.name = 'Arena'
arena.enemy = monsters.opponenet
