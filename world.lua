module(..., package.seeall);
require 'clone'
require 'player'

world = clone.object:clone()

-- your home
home = world:clone()

-- the store
shop = world:clone()
shop.buy = function(itemname)
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. 'not a valid weapon name.\n')
		return
	end
	local item = weapons[itemname]
	if player.money < item.cost then
		print('Error: Not enough money for ' .. itemname .. '.\n')
		return
	else
		print('Buying ' .. itemname .. '...\n')
		player.money = player.money - item.cost
		table.insert(player.inventory,item,item)
	end
end
shop.sell = function(itemname)
	if weapons[itemname] == nil then
		print('Error: ' .. itemname .. 'not a valid weapon name.\n')
		return
	end
	local item = weapons[itemname]
	print('Selling ' .. itemname .. '...\n')
	player.money = player.money + item.cost*.80
	table.remove(player.inventory,item)
end

-- the woods
forest = world:clone()

-- the mountains
mountain = world:clone()

-- the lake
lake = world:clone()

-- the beach
beach = world:clone()
graveyard = world:clone()
