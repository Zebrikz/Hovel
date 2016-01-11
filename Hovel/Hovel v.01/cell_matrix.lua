--cell_matrix Class
--provides a matrix used for holding tile information
--Date: 01/07/2016
--Author: Johann S. R. Eckman

require("tile_sets")
Tile = require("tile")
Building = require("building")
Resource = require("resource")

house_image = love.graphics.newImage("House_Image.png")
big_house_image = love.graphics.newImage("Big_House_Image.png")

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

function matrix.draw_board( width, height )
	--draw tiles
	for i = 0, width do
		for j = 0, height do
			love.graphics.setColor( matrix[i][j].terrain.color_r, matrix[i][j].terrain.color_g, matrix[i][j].terrain.color_b )
			love.graphics.rectangle( "fill", matrix[i][j].x * 25, matrix[i][j].y * 25, 25, 25)
		end
	end

	--draw buildings and resources
	for i = 0, width do
		for j = 0, height do
			if matrix[i][j].has_building then
				love.graphics.draw( matrix[i][j].building.image, i * 25, j * 25 )
			end
			if main_cells[i][j].has_resource then
				love.graphics.draw( matrix[i][j].resource.image, i * 25, j * 25 )
			end
		end
	end

	love.graphics.setColor( 255, 255, 255 )
	--set up the grid
	for i=25, 800, 25 do
		love.graphics.line( 0, i, 1200, i )
	end
	for i=25, 1200, 25 do 
		love.graphics.line(i, 0, i, 800)
	end

end

function matrix.build_test_map()
	--setup terrain
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

	--setup resources
	for i = 10, 14 do
		for j = 1, 2 do
			matrix[i][j].has_resource = true
			matrix[i][j].resource = Resource.initialize( "Tree" )
		end
	end

	for i = 20, 22 do
		for j = 7, 8 do
			matrix[i][j].has_resource = true
			matrix[i][j].resource = Resource.initialize( "Stone" )
		end
	end

	matrix[18][2].has_resource = true
	matrix[18][2].resource = Resource.initialize( "Animal" )

	matrix[4][25].has_resource = true
	matrix[4][25].resource = Resource.initialize( "Fruit" )


	--setup initial buildings
	matrix[10][4].has_building = true
	matrix[10][4].building = Building.initialize( "Hovel", house_image, big_house_image)

	matrix[13][4].has_building = true
	matrix[13][4].building = Building.initialize( "Hovel", house_image, big_house_image)
end

return Cell_Matrix