--Bottom UI  Class
--Date: 01/09/2016
--Author: Johann S. R. Eckman

Panel = require("panel")

Button = require("button")

local Bottom_UI = Panel:new{}

Bottom_UI.selection_coords = nil

function Bottom_UI:initialize( x, y, width, height, color_r, color_g, color_b, map_matrix )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
	self.color_r = color_r
	self.color_g = color_g
	self.color_b = color_b
	self.map_matrix = map_matrix
	self.entities = {}
	self.num_entities = 0

	self.entities[1] = Button:new{}
	self.entities[1]:initialize( self.x_pos + 1050, self.y_pos + 50, 100, 100, "End Turn" )
	self.num_entities = 1

	--TESTING STUFF 
	self.entities[1].action = function()
		self.map_matrix[10][5].terrain.color_r = 100
		self.map_matrix[10][5].terrain.color_g = 100
		self.map_matrix[10][5].terrain.color_b = 100
	end
	self.map_matrix[1][5].terrain.color_r = 100
	self.map_matrix[1][5].terrain.color_g = 100
	self.map_matrix[1][5].terrain.color_b = 100


end

function Bottom_UI:draw_panel()
	--draw the panel
	love.graphics.setColor( self.color_r, self.color_g, self.color_b )
	love.graphics.rectangle( "fill", self.x_pos, self.y_pos, self.width, self.height )

	--draw the selected tile background box
	local test_terrain = {}
	test_terrain.color_r = 193
	test_terrain.color_g = 150
	test_terrain.color_b = 100
	love.graphics.setColor( self.map_matrix[selected_x + 1][selected_y + 1].terrain.color_r, 
							self.map_matrix[selected_x + 1][selected_y + 1].terrain.color_g, 
							self.map_matrix[selected_x + 1][selected_y + 1].terrain.color_b )
	love.graphics.rectangle( "fill", 50 + self.x_pos, 25 + self.y_pos, 150, 150 )

	--draw the image of the building or resource on the selected tile if it has one


	--print the text next to the selected tile
	local test_selected_info = {}
	test_selected_info.name = "Test"
	test_selected_info.desc = "This is a test description\nread it well lawlz"
	love.graphics.setColor( 255, 255 , 255 )
	love.graphics.print( test_selected_info.name, self.x_pos + 205, self.y_pos + 25 )
	love.graphics.print( test_selected_info.desc, self.x_pos + 205, self.y_pos + 50 )

	--print the village stats: name, pop, wealth
	local test_village = {}
	test_village.name = "Test Village"
	test_village.pop = 10
	test_village.wealth = 10000
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( "Village: " .. test_village.name, self.x_pos + 500, self.y_pos + 170 )
	love.graphics.print( "Pop: " .. test_village.pop, self.x_pos + 650, self.y_pos + 170 )
	love.graphics.print( "Wealth: " .. test_village.wealth, self.x_pos + 725, self.y_pos + 170 )


	--print the resource stats: w, f, s
	test_village.wood = 10
	test_village.food = 30
	test_village.stone = 50
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( "Resources: ", 850, 970 )
	love.graphics.print( "W:" ..test_village.wood, self.x_pos + 925, self.y_pos + 170 )
	love.graphics.print( "S:" ..test_village.stone, self.x_pos + 975, self.y_pos + 170 )
	love.graphics.print( "F:" ..test_village.food, self.x_pos + 1025, self.y_pos + 170 )

	--print the turn date: w/m/y
	local test_turn = {}
	test_turn.week = 1
	test_turn.month = 12
	test_turn.year = 16
	love.graphics.setColor( 255, 255, 255 )
	love.graphics.print( "W:" ..test_turn.week, self.x_pos + 1050, self.y_pos + 150 )
	love.graphics.print( "M:" ..test_turn.month, self.x_pos + 1075, self.y_pos + 150 )
	love.graphics.print( "Y:" ..test_turn.year, self.x_pos + 1105, self.y_pos + 150 )
end

return Bottom_UI