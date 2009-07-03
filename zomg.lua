require "clone"
require 'monsters'
require 'weapons'
require 'world'

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
	buy = function(thing)
			print("Buying " .. thing)
		end,
	sell = function(thing)
			print("Selling " .. thing)
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
	line = io.read("*line") 
	if commands[line] ~= nil then
		commands[line]()
	end
until line == "exit"
