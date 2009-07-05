require 'player'

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
	elseif player.location[fields[1]] ~= nil then
		-- location-specific commands
		player.location[fields[1]](fields)
	else
		-- bad command
		print('Error: not a valid command here.')
	end
until false

print('Exiting ... Goodbye!\n')
