--Game_Board Class
--Class that encapsulates the grid and map which will have all
--the game objects on it such as buildings, resources, terrain.
--The grid is made up of tiles which at the base are terrarin and then
--can have objects on top of them.
--Each individual tile is also selectable.
--Date: 01/08/2016
--Author: Johann S. R. Eckman

Panel = require("panel")
Selection_Box = require("selection_box")

local Game_Board = Panel:new{}

Game_Board.grid_width = nil
Game_Board.grid_height = nil
Game_Board.map_matrix = nil

function Game_Board:initialize( x, y, width, height, color_r, color_g, color_b, map_matrix )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
	self.color_r = color_r
	self.color_g = color_g
	self.color_b = color_b
	self.entities = {}
	self.grid_width = width / 25
	self.grid_height = height / 25
	self.map_matrix = map_matrix
	self.entities[1] = Selection_Box:new{}
	self.entities[1]:initialize( 0, 0, 25, 25, width, height )
	self.num_entities = 1
end

function Game_Board:draw_panel()
	--draw tiles
	for i = 0, self.grid_width - 1 do
		for j = 0, self.grid_height - 1 do
			love.graphics.setColor( self.map_matrix[i+1][j+1].terrain.color_r, self.map_matrix[i+1][j+1].terrain.color_g, self.map_matrix[i+1][j+1].terrain.color_b )
			love.graphics.rectangle( "fill", i * 25, j * 25, 25, 25 )
		end
	end

	--draw buildings and resources(classes not yet implemented)
	-- for i = 1, self.grid_width do
	-- 	for j = 1, self.grid_height do
	-- 		if self.map_matrix[i][j].has_building then
	-- 			love.graphics.draw( self.map_matrix[i][j].bulding.image, i * 25, j * 25 )
	-- 		end
	-- 		if self.map_matrix[i][j].has_resource then
	-- 			love.graphics.draw( self.map_matrix[i][j].resource.image, i *25, j * 25 )
	-- 		end
	-- 	end
	-- end

	--draw the grid
	love.graphics.setColor( 255, 255, 255 )
	--draw horizontal lines
	for i = 25, self.height, 25 do
		love.graphics.line( 0, i, 1200, i )
	end
	--draw vertical lines
	for i = 25, self.width, 25 do
		love.graphics.line( i, 0, i, 800 )
	end

end

return Game_Board

