--Panel Class
--Each part of the UI is sperated as a panel object with its own entities.
--Date: 01/08/2016
--Author: Johann S. R. Eckman

local Panel = {}

Panel.x_pos = nil
Panel.y_pos = nil
Panel.width = nil
Panel.height = nil
Panel.color_r = nil
Panel.color_g = nil
Panel.color_b = nil
Panel.is_visible = nil
Panel.is_focused = nil
Panel.entities = nil
Panel.num_entities = nil

function Panel:new( o )
	o = o or {}
	setmetatable( o, self )
	self.__index = self
	return o
end

function Panel:initialize( x, y, width, height, color_r, color_g, color_b )
	self.x_pos = x
	self.y_pos = y
	self.width = width
	self.height = height
	self.color_r = color_r
	self.color_g = color_g
	self.color_b = color_b
	self.entities = {}
	self.num_entities = 0
end

function Panel:draw_panel()
	--draw the panel
	love.graphics.setColor( self.color_r, self.color_g, self.color_b )
	love.graphics.rectangle( "fill", self.x_pos, self.y_pos, self.width, self.height )
	--draw the entities that go on the panel
	for i = 1, self.num_entities do
		self.entities[i]:draw_entity()
	end
end

return Panel



