require 'player'

local commands = {
	attack = function(weapon, monster)
			print("attack")
		end,
	flee = function()
			 print("Run away!!!")
		end,
	move = function(fields)
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
	end,
	drop = function(thing)
			print("Dropping " .. thing)
		end,
	equip = function(thing)
			print("Equipping" .. thing)
		end,
	whereami = function()
			print('I am at the '..player.location.name..'.')
		end,
	help = function(fields)
			print("Help with what?")
		end
}

repeat
	-- print the player a sort of prompt
	player.location:describe()
	-- print prompt to screen
	io.write('>>> ')
	-- get player input
	line = io.read("*line") 
	-- get args from line
	fields = {}
	line:gsub("(%w+)",(function(w)table.insert(fields,w) end))
	-- check for exit condition first
	if fields[1] == 'exit' then
		break
	-- general commands (any location)
	elseif commands[fields[1]] ~= nil then
		commands[fields[1]](fields)
	-- location-specific commands
	elseif player.location[fields[1]] ~= nil then
		player.location[fields[1]](fields)
	-- bad command
	else
		print('Error: not a valid command.')
	end
until false
