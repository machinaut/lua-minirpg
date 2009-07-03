module(..., package.seeall);
require 'clone'
require 'world'
require 'weapons'

-- the player's bag of stuff
inventory = {}

-- cash on hand
money = 1000

-- where you're at
location = world['shop']
