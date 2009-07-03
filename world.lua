module(..., package.seeall);
require 'clone'
require 'player'
require 'monsters'

world = clone.object:clone()
function world:describe()
	print('You are at the '..self.name..'.')
end

-- your home
home = world:clone()
home.name = 'Home'

-- the store
shop = world:clone()
shop.name = 'Shop'
shop.describe = function()
	print('You are at the Shop.')
	print('You have '..player.money..' monies.')
end
shop.buy = function(fields)
	if #fields ~= 2 or fields[2] == 'help' then
		print('Usage: buy itemname')
		return
	end
	local itemname = fields[2]
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. ' not a valid weapon name.')
		return
	end
	local item = weapons[itemname]
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
	if #fields ~= 2 or fields[2] == 'help' then
		print('Usage: sell itemname')
		return
	end
	local itemname = fields[2]
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. ' not a valid weapon name.')
		return
	end
	local item = weapons[itemname]
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
combat = world:clone()
combat.name = 'Combat Zone'
combat.enemy = monsters.opponent
combat.describe = function()
	print('You are at the '..player.location.name..'.')
	print('There is a '..player.location.enemy.name..' here.')
end
combat.attack = function(fields)
	if #fields ~= 1 or fields[2] == 'help' then
		print('Usage: attack')
		return
	elseif player.location.enemy == nil then
		print("There's no one here to attack.")
		return
	else
		print("Attacking "..player.location.enemy.name.." ...")
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

-- the woods
forest = combat:clone()
forest.name = 'Forest'
forest.enemy = monsters.swallow

-- the mountains
mountain = combat:clone()
mountain.name = 'Mountains'
mountain.enemy = monsters.mole

-- the lake
lake = combat:clone()
lake.name = 'Lake'
lake.enemy = monsters.zombie

-- the beach
beach = combat:clone()
beach.name = 'Beach'
beach.enemy = monsters.seagull

-- the graveyard
graveyard = combat:clone()
graveyard.name = 'Graveyard'
graveyard.enemy = monsters.zombie

-- the arena
arena = combat:clone()
arena.name = 'Arena'
arena.enemy = monsters.opponenet
