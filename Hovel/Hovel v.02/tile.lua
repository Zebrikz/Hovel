--Tile Class
--Date: 01/08/2016
--Author: Johann S. R. Eckman

Terrain = require("terrain")

local Tile = {}

Tile.terrain = nil
Tile.has_resource = false
Tile.resource = nil
Tile.has_building = false
Tile.building = nil

function Tile:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Tile:initialize( t_type )
	self.terrain = Terrain:new{}
	self.terrain:initialize( t_type )
end

return Tile