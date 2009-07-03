module(..., package.seeall);
require 'clone'

monster = clone.object:clone()

-- beasty types you'll encounter
flying = monster:clone()
ground = monster:clone()

-- ground types
mole = ground:clone()

-- flying types
swallow = flying:clone()
