--Tile class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

Terrain = require("terrain")

local Tile = {}

function Tile.initialize( x, y, t_type )
	local tile = {}
	tile.x = x
	tile.y = y
	tile.terrain = Terrain.initialize( t_type )
	tile.has_resource = false
	tile.resource = nil
	tile.has_building = false
	tile.building = nil
	return tile
end

return  Tile