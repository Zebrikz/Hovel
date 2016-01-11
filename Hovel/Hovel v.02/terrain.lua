--Terrain Class
--Date: 01/08/2016
--Author: Johann S. R. Eckman

local Terrain = {}

Terrain.type = nil
Terrain.description = nil
Terrain.color_r = nil
Terrain.color_g = nil
Terrain.color_b = nil
Terrain.has_building = false
Terrain.building = nil
Terrain.has_resource = false
Terrain.resource = nil

function Terrain:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Terrain:initialize( type )
	self.type = type
	if type == "Grass" then
		self.description = "Grass terrain that can be\nbuilt upon and cultivated\nfor farming"
		self.color_r = 102
		self.color_g = 255
		self.color_b = 0
	elseif type == "Dirt" then
		self.description = "Dirt terrain that can be\nbuilt upon"
		self.color_r = 152
		self.color_g = 100
		self.color_b = 0
	else
		self.description = "Water terrain that can be\nbuilt upon by water based\nstructures"
		self.color_r = 0
		self.color_g = 96
		self.color_b = 255
	end
end

return Terrain

