require 'player'

local commands = {
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
	-- print a newline so the player can see separate 'timesteps'
	print('')
	
	-- print the player a sort of prompt
	player.location:describe()
	io.write("(>'.')> ")
	
	-- get player input
	line = io.read("*line")
	
	-- exit if end-of-file (Ctrl+D)
	if line == nil then
		print('')
		break
	end
	
	-- get args from line
	local fields = {}
	line:gsub("(%w+)",(function(w)table.insert(fields,w) end))
	
	if fields[1] == 'exit' then
		break
	elseif line == '' then
		print('Please enter a command.')
	elseif commands[fields[1]] ~= nil then
		-- general commands (any location)
		commands[fields[1]](fields)
	elseif player.location[fields[1]] ~= nil then
		-- location-specific commands
		player.location[fields[1]](fields)
	else
		-- bad command
		print('Error: not a valid command here.')
	end
until false

print('Exiting ... Goodbye!\n')
