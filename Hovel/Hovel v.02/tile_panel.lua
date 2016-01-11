--Tile Panel Class
--Tile panel that comes up when a tile is right clicked.
--contains buttons corresponding to available actions on the tile depending on the type
--of tile; terrain, building, or resource
--Date: 01/09/2016
--Author: Johann S. R. Eckman

Button = require("button")
Selection_Bound = require("selection_bound")

local Tile_Panel = {}

Tile_Panel.x_pos = nil
Tile_Panel.y_pos = nil
Tile_Panel.width = nil
Tile_Panel.height = nil
Tile_Panel.max_x = nil
Tile_Panel.max_y = nil
Tile_Panel.is_visible = nil
Tile_Panel.is_focused = nil
Tile_Panel.entities = nil
Tile_Panel.num_entities = nil

function Tile_Panel:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Tile_Panel:initialize( x, y, width, height, x_max, y_max )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
	self.x_max = x_max
	self.y_max = y_max
	self.entities = {}

	--bounded area of seleciton, exit the tile panel if a selection is made outside of this
	self.entities[1] = Selection_Bound:new{}
	self.entities[1]:initialize( self.x_pos, self.y_pos, 85, 85 )
	self.entities[1].action = function()
		self.is_visible = false
		self.is_focused = false
		ui_manager.panels[1].is_focused = true
	end

	--build button
	self.entities[2] = Button:new{}
	--needs to be an if statement depending on location of the tile
	self.entities[2]:initialize( self.x_pos, self.y_pos, self.width, self.height, "B" )
	self.entities[2].action = function()
		--bring up the build menu
		self.is_visible = false
		self.is_focused = false
		ui_manager.panels[1].is_focused = true
	end

	--examine button
	self.entities[3] = Button:new{}
	--needs to be an if statment depending on location of the tile(the if statement needs to be in the  draw function)
	self.entities[3]:initialize( self.x_pos, self.y_pos, self.width, self.height, "E" )
	self.entities[3].action = function()
		--bring up the examine menu
		self.is_visible = false
		self.is_focused = false
		ui_manager.panels[1].is_focused = true
	end

	--assign harvest button
	self.entities[4] = Button:new{}
	self.entities[4]:initialize( self.x_pos, self.y_pos, self.width, self.height, "H" )
	self.entities[4].action = function()
		--bring up the villager list
		self.is_visible = false
		self.is_focused = false
		ui_manager.panels[1].is_focused = true
	end

	--assign build button
	self.entities[5] = Button:new{}
	self.entities[5]:initialize( self.x_pos, self.y_pos, self.width, self.heigth, "C" )
	self.entities[5].action = function()
		--bring up the villager list
	end

	--improve button
	self.entities[6] = Button:new{}
	self.entities[6]:initialize( self.x_pos, self.y_pos, self.width, self.height, "I")
	self.entities[6].action = function()
		--bring up the improvement menu
	end

	self.num_entities = 4
end

function Tile_Panel:draw_panel()
	self.x_pos = selected_x * 25
	self.y_pos = selected_y * 25
	--set the location and range of the selection bound
	self.entities[1].x_pos = ( self.x_pos ) - 30 
	self.entities[1].y_pos = ( self.y_pos ) - 30
	
	--check coordinates of buttons so they stay on screen
	if self.x_pos == self.x_max - 25 and self.y_pos == 0 then
		self.entities[2].x_pos = ( self.x_pos ) - 30
		self.entities[2].y_pos = ( self.y_pos ) + 30
	elseif self.x_pos == self.x_max - 25 and self.y_pos == self.y_max - 25 then
		self.entities[2].x_pos = ( self.x_pos ) - 30
		self.entities[2].y_pos = ( self.y_pos ) - 30
	elseif self.x_pos == self.x_max - 25 then
		self.entities[2].x_pos = ( self.x_pos )
		self.entities[2].y_pos = ( self.y_pos ) + 30
	else
		self.entities[2].x_pos = ( self.x_pos ) + 30
		self.entities[2].y_pos = ( self.y_pos )
	end

	if self.x_pos == 0 and self.y_pos == 0 then
		self.entities[3].x_pos = ( self.x_pos ) + 30
		self.entities[3].y_pos = ( self.y_pos ) + 30
	elseif self.x_pos == 0 and self.y_pos == self.y_max - 25 then
		self.entities[3].x_pos = ( self.x_pos ) + 30
		self.entities[3].y_pos = ( self.y_pos ) - 30
	elseif self.x_pos == 0 then
		self.entities[3].x_pos = ( self.x_pos )
		self.entities[3].y_pos = ( self.y_pos ) + 30
	else
		self.entities[3].x_pos = ( self.x_pos ) - 30
		self.entities[3].y_pos = ( self.y_pos )
	end

	if  self.y_pos == 0 then
		self.entities[4].x_pos = ( self.x_pos )
		self.entities[4].y_pos = ( self.y_pos ) + 30
	else
		self.entities[4].x_pos = ( self.x_pos )
		self.entities[4].y_pos = ( self.y_pos ) - 30
	end

	--if selected tile is terrain
		--draw 2 buttons
	--if selected tile is building
		--draw 3 buttons
	--if selected tile is resource
		--draw 2 buttons

	self.entities[2]:draw_entity()
	self.entities[3]:draw_entity()
	self.entities[4]:draw_entity()
end

return Tile_Panel
