--cell_matrix Class
--provides a matrix used for holding tile information
--Date: 01/07/2016
--Author: Johann S. R. Eckman

require("tile_sets")
Tile = require("tile")

local Cell_Matrix = {}

local matrix = {}

function Cell_Matrix.initialize()
	for i = 0, 47 do
		matrix[i] = {}
		for j = 0, 31 do
			matrix[i][j] = 0
		end
	end
	return matrix
end

function matrix.build_test_map()
	for i = 0, 47 do
		for j = 0, 4 do
			matrix[i][j] = Tile.initialize( i, j, DIRT_T.color_r, DIRT_T.color_g, DIRT_T.color_b )
		end
	end

	for i = 0, 47 do
		for j = 5, 12 do
			matrix[i][j] = Tile.initialize( i, j, GRASS_T.color_r, GRASS_T.color_g, GRASS_T.color_b )
		end
	end

	for i = 0, 47 do
		for j = 13, 19 do
			matrix[i][j] = Tile.initialize( i, j, WATER_T.color_r, WATER_T.color_g, WATER_T.color_b )
		end
	end

	for i = 0, 47 do
		for j = 20, 29 do
		 	matrix[i][j] = Tile.initialize( i, j, GRASS_T.color_r, GRASS_T.color_g, GRASS_T.color_b )
		end
	end

	for i = 0, 47 do
		for j = 30, 31 do
			matrix[i][j] = Tile.initialize( i, j, DIRT_T.color_r, DIRT_T.color_g, DIRT_T.color_b )
		end
	end	
end

return Cell_Matrix