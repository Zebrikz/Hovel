--cell_matrix Class
--provides a matrix used for holding tile information
--Date: 01/07/2016
--Author: Johann S. R. Eckman

require("tile_sets")
Tile = require("tile")
Building = require("building")

house_image = love.graphics.newImage("House_Image.png")

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
			matrix[i][j] = Tile.initialize( i, j, "Dirt" )
		end
	end

	for i = 0, 47 do
		for j = 5, 12 do
			matrix[i][j] = Tile.initialize( i, j, "Grass" )
		end
	end

	for i = 0, 47 do
		for j = 13, 19 do
			matrix[i][j] = Tile.initialize( i, j, "Water" )
		end
	end

	for i = 0, 47 do
		for j = 20, 29 do
		 	matrix[i][j] = Tile.initialize( i, j, "Grass" )
		end
	end

	for i = 0, 47 do
		for j = 30, 31 do
			matrix[i][j] = Tile.initialize( i, j, "Dirt" )
		end
	end	

	matrix[10][4].has_building = true
	matrix[10][4].building = Building.initialize( "Hovel", house_image)

	matrix[13][4].has_building = true
	matrix[13][4].building = Building.initialize( "Hovel", house_image)
end

return Cell_Matrix