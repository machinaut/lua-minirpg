module(..., package.seeall);
require 'clone'
require 'player'

world = clone.object:clone()

-- world places
home = world:clone()
shop = world:clone()
	shop.buy = function(itemname)
		if weapons[itemname] == nil then
			print('Error: ' .. itemname .. 
				'not a valid weapon name.\n')
			return
		end
		local item = weapons[itemname]
		if player.money < item.cost then
			print('Error: Not enough money for ' ..
				itemname .. '.\n')
			return
		else
			print('Buying ' .. itemname .. '...\n')
			player.money = player.money - item.cost
			table.insert(player.inventory,item,item)
		end
	end
	shop.sell = function(itemname)
		if weapons[itemname] == nil then
			print('Error: ' .. itemname .. 
				'not a valid weapon name.\n')
			return
		end
		local item = weapons[itemname]
		print('Selling ' .. itemname .. '...\n')
		player.money = player.money + item.cost*.80
		table.remove(player.inventory,item)
	end
forest = world:clone()
mountain = world:clone()
lake = world:clone()
beach = world:clone()
graveyard = world:clone()
