--Tile class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

local Tile = {}

function Tile.initialize( x, y, r, g, b )
	local tile = {}
	tile.x = x
	tile.y = y
	tile.color_r = r
	tile.color_g = g
	tile.color_b = b
	return tile
end

return  Tile