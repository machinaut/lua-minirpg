require "clone"
require 'monsters'
require 'weapons'
require 'world'
require 'player'

local commands = {
	attack = function(weapon, monster)
			print("attack")
		end,
	flee = function()
			 print("Run away!!!")
		end,
	move = function(location)
			print("Moving to " .. location)
		end,
	drop = function(thing)
			print("Dropping " .. thing)
		end,
	equip = function(thing)
			print("Equipping" .. thing)
		end,
	help = function(thing)
			print("Help with " .. thing)
		end
}

repeat
	str = io.read("*line") 
	-- get args from line
	local fields
	line:gsub("(%w+)",(function(w)table.insert(fields,w) end))
	-- general commands (any location)
	if commands[line] ~= nil then
		commands[line]()
	-- location-specific commands
	elseif player.location[line] ~= nil then
		player.location[line]()
	end
until line == "exit"
