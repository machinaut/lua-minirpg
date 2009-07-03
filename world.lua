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
	end
	local itemname = fields[2]
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. 'not a valid weapon name.')
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
	end
	local itemname = fields[2]
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. 'not a valid weapon name.')
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

-- the woods
forest = world:clone()
forest.name = 'Forest'

-- the mountains
mountain = world:clone()
mountain.name = 'Mountains'

-- the lake
lake = world:clone()
lake.name = 'Lake'

-- the beach
beach = world:clone()
beach.name = 'Beach'

-- the graveyard
graveyard = world:clone()
graveyard.name = 'Graveyard'
