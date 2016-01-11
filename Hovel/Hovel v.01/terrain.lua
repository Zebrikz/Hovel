--terrain class
--Date: 01/07/2016
--Author: Johann S. R. Eckman

require("tile_sets")

local Terrain = {}

function Terrain.initialize( t_type )
	local terrain = {}
	if t_type == "Grass" then
		terrain.type = t_type
		terrain.description = "Grass terrain that can be\nbuilt upon and cultivated\nfor farming"
		terrain.color_r = GRASS_T.color_r
		terrain.color_g = GRASS_T.color_g
		terrain.color_b = GRASS_T.color_b
	elseif t_type == "Dirt" then
		terrain.type = t_type
		terrain.description = "Dirt terrain that can be\nbuilt upon"
		terrain.color_r = DIRT_T.color_r
		terrain.color_g = DIRT_T.color_g
		terrain.color_b = DIRT_T.color_b
	else
		terrain.type = t_type
		terrain.description = "Water terrain that can be\nbuilt upon by water based\nstructures"
		terrain.color_r = WATER_T.color_r
		terrain.color_g = WATER_T.color_g
		terrain.color_b = WATER_T.color_b
	end
	return terrain
end

return Terrain

